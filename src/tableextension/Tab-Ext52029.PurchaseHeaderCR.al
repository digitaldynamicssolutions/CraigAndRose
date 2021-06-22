tableextension 52029 "PurchaseHeaderCR" extends "Purchase Header"
{
    fields
    {
        field(52000; "No. of Comments CR"; Integer)
        {
            Caption = 'No. of Comments';
            FieldClass = FlowField;
            CalcFormula = count("Purch. Comment Line" where ("Document Type" = field("Document Type"), "No." = field("No.")));
            Editable = false;
        }
    }
}
