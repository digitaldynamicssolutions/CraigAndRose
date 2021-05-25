pageextension 52030 "ShipToAddressCR" extends "Ship-to Address"
{
    layout
    {
        addafter(Code)
        {
            field("Default CR"; rec."Default CR")
            {
                Caption = 'Default';
                ApplicationArea =all;
                ToolTip = 'This will default all sales orders to this address on release of the order.';
            }
        }
    }
}
