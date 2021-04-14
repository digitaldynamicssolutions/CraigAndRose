/// <summary>
/// PageExtension SalesOrderArchivedSubCR (ID 52014) extends Record Sales Order Archive Subform.
/// </summary>
pageextension 52018 "SalesOrderArchivedSubCR" extends "Sales Order Archive Subform"
{
    layout
    {
        addafter("Unit of Measure Code")
        {
            field("Cancellation Reason CR";rec."Cancellation Reason CR")
            {
                ApplicationArea = All;
                Caption = 'Cancellation Reason';
                Editable = false;
            }
        }
    }
}
