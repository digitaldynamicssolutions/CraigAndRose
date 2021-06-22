pageextension 52039 "PostedPurchaseInvoiceCR" extends "Posted Purchase Invoice"
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
