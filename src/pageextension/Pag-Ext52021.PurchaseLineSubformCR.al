pageextension 52021 "PurchaseLineSubformCR" extends "Purchase Order Subform"
{
    layout
    {
        addafter("No.")
        {
            field("Catalogue Code CR"; rec."Catalogue Code CR")
            {
                Caption = 'Catalogue Code';
                ApplicationArea = All;
            }
        }
    }
}
