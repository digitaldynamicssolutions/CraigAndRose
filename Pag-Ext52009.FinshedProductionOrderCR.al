/// <summary>
/// PageExtension FinshedProductionOrderCR (ID 52009) extends Record Finished Production Order.
/// </summary>
pageextension 52009 FinshedProductionOrderCR extends "Finished Production Order"
{
    layout
    {
        addafter(Quantity)
        {
            field("Total Finished Quantity CR "; rec."Total Finished Quantity CR")
            {
                ApplicationArea = All;
            }
        }
    }
}
