pageextension 52025 "PostedTransferReceiptsCR" extends "Posted Transfer Receipts"
{
    layout
    {
        addafter("No.")
        {
            field("Transfer Order No."; rec."Transfer Order No.")
            {
                ApplicationArea = All;
            }
        }
    }
}
