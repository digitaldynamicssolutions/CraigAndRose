pageextension 52037 "SalesInvoicesCR" extends "Sales Invoice List"
{
    layout
    {
        addafter("Location Code")
        {
            field("No. of Comments CR"; rec."No. of Comments CR")
            {
                ApplicationArea = All;
            }
        }
    }
}
