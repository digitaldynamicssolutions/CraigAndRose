pageextension 52046 "PostedSalesCreditMemoListCR" extends "Posted Sales Credit Memos"
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
