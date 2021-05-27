pageextension 52031 "WarehouseShipmentListCR" extends "Warehouse Shipment List"
{
    layout
    {
        addafter("Order No. QTQ")
        {
            field("Source Order No. CR"; rec."Source Order No. CR")
            {
                Caption = 'Source Order No.';
                ApplicationArea = All;
            }
        }
    }
}