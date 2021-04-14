pageextension 52017 "SalesOrderArchiveCR" extends "Sales Order Archive"
{
    layout
    {
        addafter("Document Date")
        {
            field("Cancellation Reason CR"; rec."Cancellation Reason CR")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
    }
}
