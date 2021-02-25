/// <summary>
/// Codeunit "ReleaseSalesDocExtCR" (ID 52000).
/// </summary>
codeunit 52000 ReleaseSalesDocExtCR
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", 'OnBeforeReleaseSalesDoc', '', true, true)]

    /// <summary>
    /// SalesReleaseFulfillmentLocation.
    /// </summary>
    /// <param name="SalesHeader">VAR Record "Sales Header".</param>
    procedure SalesReleaseFulfillmentLocation(var SalesHeader: Record "Sales Header")
    var
        SalesLine: Record "Sales Line";
        Item: Record Item;
        Location: Record Location;
        CompanyInfo: Record "Company Information";
        newlocation: Code[20];
        AllowNewLocation: Boolean;
    begin
        if SalesHeader."Document Type" = SalesHeader."Document Type"::Order then begin
            AllowNewLocation := true;
            SalesLine.Reset();
            SalesLine.SetRange("Document Type", SalesHeader."Document Type");
            SalesLine.SetRange("Document No.", SalesHeader."No.");
            SalesLine.SetRange(Type, salesline.Type::Item);
            if SalesLine.FindSet() then begin
                repeat
                    if item.GET(SalesLine."No.") then begin
                        if (item."Default Fulfillment Location" <> '') then begin
                            if newlocation = '' then begin
                                newlocation := item."Default Fulfillment Location";
                            end else begin
                                if newlocation <> item."Default Fulfillment Location" then
                                    AllowNewLocation := false;
                            end;

                        end else
                            AllowNewLocation := false;
                    end;
                until SalesLine.next = 0;
            end;
        end;

        if AllowNewLocation then begin
            SalesHeader.Validate("Location Code", newlocation);
            SalesLine.Reset();
            SalesLine.SetRange("Document Type", SalesHeader."Document Type");
            SalesLine.SetRange("Document No.", SalesHeader."No.");
            if SalesLine.FindSet(true, true) then begin
                repeat
                    SalesLine.Validate("Location Code", newlocation);
                    if Location.get(newlocation) then begin
                        if not Location."Require Shipment" then
                            SalesLine.Validate("Qty. to Ship", SalesLine.Quantity);
                    end;
                    Salesline.Modify(true);
                until SalesLine.next = 0;
            end;
            SalesLine.ModifyAll(Quantity, SalesLine.Quantity, true);
        end else begin
            CompanyInfo.Get;
            IF SalesHeader."Location Code" <> CompanyInfo."Location Code" then begin
                SalesHeader.Validate("Location Code", CompanyInfo."Location Code");
                SalesLine.Reset();
                SalesLine.SetRange("Document Type", SalesHeader."Document Type");
                SalesLine.SetRange("Document No.", SalesHeader."No.");
                if SalesLine.FindSet(true, true) then begin
                    repeat
                        SalesLine.Validate("Location Code", CompanyInfo."Location Code");
                        Salesline.Modify(true);
                    until SalesLine.next = 0;
                end;
                SalesLine.ModifyAll(Quantity, SalesLine.Quantity, true);
            end;

        end;
    end;
}
