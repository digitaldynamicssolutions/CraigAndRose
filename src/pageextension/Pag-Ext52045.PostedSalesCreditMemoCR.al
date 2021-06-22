pageextension 52045 "PostedSalesCreditMemoCR" extends "Posted Sales Credit Memo"
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
