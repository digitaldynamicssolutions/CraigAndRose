/// <summary>
/// PageExtension WarehouseShipmentCR (ID 52028) extends Record Warehouse Shipment.
/// </summary>
pageextension 52028 WarehouseShipmentCR extends "Warehouse Shipment"
{
    layout
    {
        addlast(General)
        {
            group(Source)
            {
                field("Source Order No. CR"; Rec."Source Order No. CR")
                {
                    ToolTip = 'Specifies the value of the Source Order No. field';
                    ApplicationArea = All;
                }
                field("Customer Posting Group CR"; Rec."Customer Posting Group CR")
                {
                    ToolTip = 'Specifies the value of the Customer Posting Group field';
                    ApplicationArea = All;
                }
                field("Source Global Dimension 1 CR"; Rec."Source Global Dimension 1 CR")
                {
                    ToolTip = 'Specifies the value of the Source Global Dimension 1 field';
                    ApplicationArea = All;
                }
                field("Source Global Dimension 2 CR"; Rec."Source Global Dimension 2 CR")
                {
                    ToolTip = 'Specifies the value of the Source Global Dimension 2 field';
                    ApplicationArea = All;
                }
                field("Source Order Date CR"; Rec."Source Order Date CR")
                {
                    ToolTip = 'Specifies the value of the Source Order Date field';
                    ApplicationArea = All;
                }
                field("Source Ship-to Name CR"; Rec."Source Ship-to Name CR")
                {
                    ToolTip = 'Specifies the value of the Source Ship-to Name field';
                    ApplicationArea = All;
                }


            }
        }
    }
}
