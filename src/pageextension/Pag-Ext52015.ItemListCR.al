/// <summary>
/// PageExtension "ItemListCR" (ID 52014) extends Record Item List.
/// </summary>
pageextension 52015 ItemListCR extends "Item List"
{
    layout
    {
        addafter(InventoryField)
        {
            field("Qty. on Sales Order"; rec."Qty. on Sales Order")
            {
                ApplicationArea = All;
            }
            field("Qty. on Purch. Order"; rec."Qty. on Purch. Order")
            {
                ApplicationArea = All;
            }
            field("Qty. on Prod. Order"; rec."Qty. on Prod. Order")
            {
                ApplicationArea = All;
            }
            field("Qty. on Component Lines"; rec."Qty. on Component Lines")
            {
                ApplicationArea = All;
            }
        }
    }
}
