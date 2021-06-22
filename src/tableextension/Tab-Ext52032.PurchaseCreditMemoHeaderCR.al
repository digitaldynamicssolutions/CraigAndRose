tableextension 52032 "PurchaseCreditMemoHeaderCR" extends "Purch. Cr. Memo Hdr."
{
    fields
    {
        field(52000; "No. of Comments CR"; Integer)
        {
            Caption = 'No. of Comments';
            FieldClass = FlowField;
            CalcFormula = count("Purch. Comment Line" where ("Document Type" = const(8), "No." = field("No.")));
            Editable = false;
        }
    }
}
