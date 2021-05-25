pageextension 52026 "ShipToAddressListCR" extends "Ship-to Address List"
{
    layout
    {
        addafter(Code)
        {
            field("Default CR"; rec."Default CR")
            {
                Caption = 'Default';
                ApplicationArea = All;
            }
        }
    }


    }
