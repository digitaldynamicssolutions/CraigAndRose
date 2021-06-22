tableextension 52030 "PurchaseReceiptHeaderCR" extends "Purch. Rcpt. Header"
{
    fields
    {
        field(52000; "No. of Comments CR"; Integer)
        {
            Caption = 'No. of Comments';
            FieldClass = FlowField;
            CalcFormula = count("Purch. Comment Line" where ("Document Type" = const(6), "No." = field("No.")));
            Editable = false;
        }
    }
}
