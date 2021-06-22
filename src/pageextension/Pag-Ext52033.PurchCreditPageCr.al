pageextension 52033 "PurchCreditPageCr" extends "Purchase Credit Memo"
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