/// <summary>
/// Codeunit CR Job Queue Functions (ID 52001).
/// </summary>
codeunit 52001 "Job Queue Functions CR"
{
    TableNo = "Job Queue Entry";

    trigger OnRun()
    begin

        if Rec."Parameter String" = 'OTMNEWORDERS' then begin
            SendOTMOrders();
        end;

        if rec."Parameter String" = 'OTMPOSTORDERS' then begin
            PostOTMOrders();
        end;

        //V1.0.0.5 02/03/21 -
        if rec."Parameter String" = 'OTMRELEASEORDERS' then begin
            ReleaseOTMOrders();
        end;
        //V1.0.0.5 02/03/21 +

    end;

    local procedure SendOTMOrders()
    var
        SalesHeader: Record "Sales Header";
        SalesSetup: Record "Sales & Receivables Setup";
        Email: Codeunit Email;
        MailMessage: Codeunit "Email Message";
        TempBlob: Codeunit "Temp Blob";
        base64: Codeunit "Base64 Convert";
        OTMSalesReport: Report "OTM Sales Lines To Ship CR";
        OTMOutstream: Outstream;
        OTMInstream: InStream;


    begin
        SalesSetup.GET;
        SalesSetup.TestField("OTM Order E-mail Address");
        SalesHeader.reset;
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
        SalesHeader.SetRange("Location Code", SalesSetup."OTM Location Code");
        SalesHeader.SetRange(Status, SalesHeader.Status::Released);
        SalesHeader.SetRange("Sent to OTM", false);
        if not SalesHeader.IsEmpty then begin
            TempBlob.CreateOutStream(OTMOutstream);
            OTMSalesReport.SetItemCatFilter('595');
            OTMSalesReport.SaveAs('OTM Patch Orders', ReportFormat::Word, OTMOutstream);
            TempBlob.CreateInStream(OTMInstream);
            MailMessage.Create(SalesSetup."OTM Order E-mail Address", 'Craig & Rose Order', 'Please see order files attached');
            MailMessage.AddAttachment('Craig & Rose Patch Order.docx', 'application/docx', base64.ToBase64(OTMInstream));

            Clear(TempBlob);
            Clear(OTMSalesReport);
            TempBlob.CreateOutStream(OTMOutstream);
            OTMSalesReport.SetItemCatFilter('630|590');
            OTMSalesReport.SaveAs('OTM Card Orders', ReportFormat::Word, OTMOutstream);
            TempBlob.CreateInStream(OTMInstream);
            MailMessage.AddAttachment('Craig & Rose Colour Card Order.docx', 'application/docx', base64.ToBase64(OTMInstream));
            Email.Send(MailMessage);
            UpdateOTMOrders();
        end;
    end;

    local procedure PostOTMOrders()
    var
        SalesSetup: Record "Sales & Receivables Setup";
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        Location: Record Location;
        SalesPost: Codeunit "Sales-Post";
        FilterDate: date;
        FilterDateTime: datetime;
    begin
        SalesSetup.GET;
        Location.GET(SalesSetup."OTM Location Code");
        FilterDate := CalcDate(SalesSetup."OTM Order Posting Delay (Days)", Today);
        FilterDateTime := CreateDateTime(FilterDate, 0T);
        SalesHeader.Reset;
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
        SalesHeader.SetRange(Status, SalesHeader.Status::Released);
        SalesHeader.SetRange("Location Code", SalesSetup."OTM Location Code");
        SalesHeader.SetRange("Sent to OTM", true);
        SalesHeader.SetFilter("Sent to OTM DateTime", '..%1', FilterDateTime);
        If SalesHeader.FindSet(true, false) then begin
            repeat
                SalesLine.reset;
                SalesLine.SetRange("Document Type", SalesHeader."Document Type");
                SalesLine.SetRange("Document No.", SalesHeader."No.");
                if SalesLine.Findset(true, false) then begin
                    repeat
                        SalesLine.validate("Qty. to Ship", SalesLine."Outstanding Quantity");
                        SalesLine.validate("Qty. to Invoice", SalesLine."Outstanding Quantity");
                        if Location."Bin Mandatory" then
                            SalesLine."Bin Code" := 'BIN1';
                        SalesLine.Modify(false);
                    until SalesLine.next = 0;
                end;
                SalesHeader."Posting Date" := TODAY;
                SalesHeader.Ship := true;
                SalesHeader.Invoice := true;
                SalesHeader.SetHideValidationDialog(true);
                SalesHeader.Modify(false);
                SalesPost.Run(SalesHeader);
            until SalesHeader.Next = 0;
        end;
    end;


    local procedure UpdateOTMOrders()
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        SalesSetup: Record "Sales & Receivables Setup";

    begin
        SalesSetup.Get;
        SalesHeader.Reset;
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
        SalesHeader.SetRange(Status, SalesHeader.Status::Released);
        SalesHeader.SetRange("Location Code", SalesSetup."OTM Location Code");
        SalesHeader.SetRange("Sent to OTM", false);
        If SalesHeader.FindSet(true, false) then begin
            repeat
                SalesHeader.Validate("Sent to OTM", true);
                SalesHeader.Validate("Sent to OTM DateTime", CurrentDateTime);
                SalesHeader.Validate("Package Tracking No.", 'NOTRACK');
                SalesHeader.Modify(false);

                //update lines
                SalesLine.reset;
                SalesLine.SetRange("Document Type", SalesHeader."Document Type");
                SalesLine.SetRange("Document No.", SalesHeader."No.");
                if SalesLine.Findset(true, false) then begin
                    repeat
                        SalesLine.validate("Sent to OTM", true);
                        SalesLine.Modify(false);
                    until SalesLine.next = 0;
                end;
            until SalesHeader.Next = 0;
        end;
    end;

    local procedure ReleaseOTMOrders()
    //V1.0.0.5 02/03/21 -+
    var
        CompanyInfo: Record "Company Information";
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        Item: Record Item;
        SalesSetup: Record "Sales & Receivables Setup";
        ReleaseSalesDocument: Codeunit "Release Sales Document";
        AutoRelease: Boolean;
        ToDate: Date;

    begin

        SalesSetup.GET;
        CompanyInfo.GET;
        CompanyInfo.TestField("Location Code");
        ToDate := CalcDate('-1D', Today);

        //Find Orders
        SalesHeader.Reset();
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
        SalesHeader.SetRange("Location Code", CompanyInfo."Location Code");
        SalesHeader.SetRange(Status, SalesHeader.Status::Open);
        SalesHeader.SetFilter("Order Date", '..%1', ToDate);
        //DOC V1.0.0.7 -
        SalesHeader.SetRange("CS On Hold CR", false);
        SalesHeader.SetRange("CS To Cancel CR", false);
        //DOC V1.0.0.7 +
        if SalesHeader.FindSet(true, false) then begin
            repeat

                if (SalesHeader."Ship-to Name" <> '') and (SalesHeader."Ship-to Address" <> '') and (SalesHeader."Ship-to Post Code" <> '') and (SalesHeader."Ship-to Country/Region Code" <> '') then begin
                    AutoRelease := true;
                    SalesLine.Reset();
                    SalesLine.SetRange("Document Type", SalesHeader."Document Type");
                    SalesLine.SetRange("Document No.", SalesHeader."No.");
                    SalesLine.SetRange(type, SalesLine.type::Item);
                    SalesLine.SetFilter("Item Category Code", '<>%1', '260');
                    SalesLine.SetFilter("Outstanding Quantity", '<>%1', 0);
                    if SalesLine.FindSet(false, false) then begin
                        repeat
                            if AutoRelease then begin
                                if item.get(SalesLine."No.") then begin
                                    if item."Default Fulfillment Location" = SalesSetup."OTM Location Code" then
                                        AutoRelease := true
                                    else
                                        AutoRelease := false;
                                end;
                            end;
                        until SalesLine.Next = 0;
                    end else
                      AutoRelease := false;

                    if AutoRelease then begin
                        ReleaseSalesDocument.Run(SalesHeader);
                    end;
                end;
            until SalesHeader.next = 0;
        end;

    end;
}
