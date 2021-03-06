/// <summary>
/// Codeunit "ReleaseSalesDocExtCR" (ID 52000).
/// </summary>
codeunit 52000 ReleaseSalesDocExtCR
{
    /// <summary>
    /// SalesReleaseFulfillmentLocation.
    /// </summary>
    /// <param name="SalesHeader">VAR Record "Sales Header".</param>

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", 'OnBeforeReleaseSalesDoc', '', true, true)]

    procedure SalesReleaseFulfillmentLocation(var SalesHeader: Record "Sales Header")
    var
        SalesLine: Record "Sales Line";
        Item: Record Item;
        Location: Record Location;
        CompanyInfo: Record "Company Information";
        newlocation: Code[20];
        AllowNewLocation: Boolean;
    begin
        SalesHeader.TestField("CS On Hold CR", false);
        SalesHeader.TestField("CS To Cancel CR", false);

        if SalesHeader."Document Type" = SalesHeader."Document Type"::Order then begin
            AllowNewLocation := true;
            SalesLine.Reset();
            SalesLine.SetRange("Document Type", SalesHeader."Document Type");
            SalesLine.SetRange("Document No.", SalesHeader."No.");
            SalesLine.SetRange(Type, salesline.Type::Item);
            SalesLine.SetFilter("Item Category Code", '<>%1', '260'); //V1.0.0.1 26/02/21 -+
            if SalesLine.FindSet() then begin
                repeat
                    if item.GET(SalesLine."No.") then begin
                        if (item."Default Fulfillment Location" <> '') then begin
                            if newlocation = '' then begin
                                newlocation := item."Default Fulfillment Location";
                            end else begin
                                if newlocation <> item."Default Fulfillment Location" then begin
                                    AllowNewLocation := false;
                                end;
                            end;
                        end else
                            AllowNewLocation := false;
                    end;
                until SalesLine.next = 0;
            end else
                AllowNewLocation := false;
        end;

        if AllowNewLocation then begin
            SalesHeader.Validate("Location Code", newlocation);
            SalesHeader.Validate("Shipping Advice", SalesHeader."Shipping Advice"::Complete); //V1.0.0.5 02/03/21 -+
            SalesLine.Reset();
            SalesLine.SetRange("Document Type", SalesHeader."Document Type");
            SalesLine.SetRange("Document No.", SalesHeader."No.");
            SalesLine.SetFilter("Location Code", '<>%1', ''); //V1.0.0.2 26/02/21 -+
            if SalesLine.FindSet(true, true) then begin
                repeat
                    SalesLine.Validate("Location Code", newlocation);
                    if Location.get(newlocation) then begin
                        if not Location."Require Shipment" then begin
                            SalesLine.Validate("Qty. to Ship", SalesLine.Quantity);
                            SalesLine.Validate("Qty. to Invoice", SalesLine.Quantity);
                        end;
                    end;
                    Salesline.Modify(true);
                until SalesLine.next = 0;
            end;
        end else begin
            CompanyInfo.Get;
            CompanyInfo.TestField("Location Code");
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
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", 'OnBeforeReleaseSalesDoc', '', true, true)]
    /// <summary>
    /// SetGLServiceLines.
    /// </summary>
    /// <param name="SalesHeader">VAR Record "Sales Header".</param>
    procedure SetGLServiceLines(var SalesHeader: Record "Sales Header")
    var
        SalesLine: Record "Sales Line";
        Location: Record Location;
        item: Record Item;
    begin
        if SalesHeader."Document Type" = SalesHeader."Document Type"::Order then begin
            if Location.get(SalesHeader."Location Code") then begin
                if Location."Require Shipment" then begin
                    SalesLine.SetRange("Document Type", SalesHeader."Document Type");
                    SalesLine.SetRange("Document No.", SalesHeader."No.");
                    if SalesLine.FindSet(true, false) then begin
                        repeat
                            if SalesLine.Type = SalesLine.Type::"G/L Account" then begin
                                SalesLine.Validate("Qty. to Ship", SalesLine."Outstanding Quantity");
                                SalesLine.modify(true);
                            end else begin
                                if SalesLine.Type = SalesLine.Type::Item then begin
                                    if item.get(SalesLine."No.") then begin
                                        if item.Type = item.type::Service then begin
                                            SalesLine.Validate("Qty. to Ship", SalesLine."Outstanding Quantity");
                                            SalesLine.modify(true);
                                        end;
                                    end;
                                end;
                            end;
                        until SalesLine.next = 0;
                    end
                end;
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", 'OnBeforeReleaseSalesDoc', '', true, true)]
    /// <summary>
    /// SetGLServiceLines.
    /// </summary>
    /// <param name="SalesHeader">VAR Record "Sales Header".</param>
    procedure UpdateDefaultShipping(var SalesHeader: Record "Sales Header")
    var
        SalesLine: Record "Sales Line";
        Location: Record Location;
        Customer: Record Customer;
        ShipToAddress: Record "Ship-to Address";
    begin
        if SalesHeader."Document Type" = SalesHeader."Document Type"::Order then begin
            if SalesHeader."Ship-to Code" = '' then begin
                if Location.get(SalesHeader."Location Code") then begin
                    if Location."Require Shipment" then begin
                        ShipToAddress.SetRange("Customer No.", SalesHeader."Sell-to Customer No.");
                        ShipToAddress.SetRange("Default CR", true);
                        IF ShipToAddress.FindFirst() then begin
                            SalesHeader.validate("Ship-to Code", ShipToAddress.code);
                            SalesHeader.Modify();
                        end;
                    end;
                end;
            end;
        end;
    end;
}
