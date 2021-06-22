pageextension 52041 "PostedPurchaseCreditMemosCR" extends "Posted Purchase Credit Memos"
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
