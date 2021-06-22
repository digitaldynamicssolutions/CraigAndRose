pageextension 52034 "PurchCreditListPageCr" extends "Purchase Credit Memos"
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