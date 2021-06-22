tableextension 52031 "PurchaseInvoiceHeaderCR" extends "Purch. Inv. Header"
{
    fields
    {
        field(52000; "No. of Comments CR"; Integer)
        {
            Caption = 'No. of Comments';
            FieldClass = FlowField;
            CalcFormula = count("Purch. Comment Line" where ("Document Type" = const(7), "No." = field("No.")));
            Editable = false;
        }
    }
}
