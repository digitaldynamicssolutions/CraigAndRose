pageextension 52014 "PurchaseOrderPageCR" extends "Purchase Order"
{
    layout
    {
        addafter(Status)
        {
            field("No. of Comments CR"; rec."No. of Comments CR")
            {
                ApplicationArea = All;
            }
        }
    }
}
