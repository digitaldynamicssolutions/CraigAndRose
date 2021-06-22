pageextension 52048 "ReleasedProductionOrderListCR" extends "Released Production Orders"
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
