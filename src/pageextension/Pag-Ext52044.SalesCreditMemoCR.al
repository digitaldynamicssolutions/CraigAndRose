pageextension 52044 "SalesCreditMemoCR" extends "Sales Credit Memo"
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
