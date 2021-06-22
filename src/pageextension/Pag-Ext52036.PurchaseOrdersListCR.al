pageextension 52036 "PurchaseOrdersListCR" extends "Purchase Order List"
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
