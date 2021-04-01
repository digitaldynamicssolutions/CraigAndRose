/// <summary>
/// Codeunit SalesEventSubCR (ID 52006).
/// </summary>
codeunit 52006 "SalesEventSubCR"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostSalesDoc', '', true, true)]

    local procedure UpdatePostingDate(var SalesHeader: Record "Sales Header")
    begin
        SalesHeader.validate("Posting Date", WorkDate);
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
}
