pageextension 52024 "PostedTransferShipmentsCR" extends "Posted Transfer Shipments"
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
