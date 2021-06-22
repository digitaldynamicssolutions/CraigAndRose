pageextension 52042 "PostedPurchCreditMemoCR" extends "Posted Purchase Credit Memo"
{
    layout
    {
        addafter("No. Printed")
        {
            field("No. of Comments CR"; rec."No. of Comments CR")
            {
                ApplicationArea = All;
            }
        }
    }
}
