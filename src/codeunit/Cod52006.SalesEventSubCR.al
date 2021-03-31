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

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Post Shipment", 'OnBeforePostedWhseShptHeaderInsert', '', true, true)]
    local procedure UpWhsePostingDate(WarehouseShipmentHeader: Record "Warehouse Shipment Header")
    begin
        WarehouseShipmentHeader.Validate("Posting Date", WorkDate);
        WarehouseShipmentHeader.Validate("Shipment Date", WorkDate);
    end;

}
