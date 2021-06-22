pageextension 52040 "SalesCreditMemosListCr" extends "Sales Credit Memos"
{
    layout
    {
        addafter("Location Code")
        {
            field("No. of Comments CR"; rec."No. of Comments CR")
            {
                ApplicationArea = All;
            }
        }
    }
}
