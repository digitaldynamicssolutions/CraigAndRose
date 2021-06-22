/// <summary>
/// Codeunit SalesEventSubCR (ID 52006).
/// </summary>
codeunit 52006 "SalesEventSubCR"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostSalesDoc', '', true, true)]

    local procedure UpdatePostingDate(var SalesHeader: Record "Sales Header")
    begin
        SalesHeader.validate("Posting Date", WorkDate);
        SalesHeader.Modify(true);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Post Shipment", 'OnBeforeCheckWhseShptLines', '', true, true)]
    local procedure UpWhsePostingDate(var WarehouseShipmentLine: Record "Warehouse Shipment Line")
    var
        WarehouseShipmentHeader: Record "Warehouse Shipment Header";
    begin
        if WarehouseShipmentHeader.Get(WarehouseShipmentLine."No.") then begin
            if WarehouseShipmentHeader."Posting Date" <> WorkDate then begin
                WarehouseShipmentHeader.Validate("Posting Date", WorkDate);
                WarehouseShipmentHeader."Shipment Date" := WorkDate;
                WarehouseShipmentHeader.Modify(true);
            end;
            WarehouseShipmentLine.Validate("Shipment Date", WorkDate);
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post (Yes/No)", 'OnBeforeConfirmPost', '', true, true)]
    local procedure SetShipppingOption(var SalesHeader: Record "Sales Header"; var IsHandled: Boolean; var Result: Boolean; var DefaultOption: Integer)
    var
        Customer: Record Customer;
        Selection: Integer;
        ShipInvoiceQst: Label 'Ship';
        ReceiveInvoiceQst: Label '&Receive,&Invoice,Receive &and Invoice';
    begin
        if SalesHeader.get(SalesHeader."Document Type", SalesHeader."No.") then begin
            if customer.get(SalesHeader."Sell-to Customer No.") then begin
                if customer."Ship Only CR" then begin
                    IsHandled := true;
                    if SalesHeader."Document Type" = SalesHeader."Document Type"::Order then begin
                        Selection := StrMenu('ShipInvoiceQst', 1);
                        SalesHeader.Ship := Selection in [1];
                        SalesHeader.Invoice := false;
                        if Selection = 0 then
                            Result := false
                        else
                            Result := true;
                    end;
                    if SalesHeader."Document Type" = SalesHeader."Document Type"::"Return Order" then begin
                        Selection := StrMenu(ReceiveInvoiceQst, DefaultOption);
                        SalesHeader.Receive := Selection in [1, 3];
                        SalesHeader.Invoice := Selection in [2, 3];
                    end;
                    SalesHeader."Print Posted Documents" := false;
                end;
            end;
        end;
    end;
}
