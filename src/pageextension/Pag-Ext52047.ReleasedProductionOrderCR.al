pageextension 52047 "ReleasedProductionOrderCR" extends "Released Production Order"
{
    layout
    {
        addafter("Assigned User ID")
        {
            field("Started CR"; Rec."Started CR")
            {
                ApplicationArea = All;
            }
        }

    }
}
