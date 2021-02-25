/// <summary>
/// TableExtension SalesCreditMemoHeaderCR (ID 52009) extends Record Sales Cr.Memo Header.
/// </summary>
tableextension 52009 "SalesCreditMemoHeaderCR" extends "Sales Cr.Memo Header"
{
    fields
    {
        field(52000; "Sent to OTM"; Boolean)
        {
            Caption = 'Sent to OTM';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(52001; "Sent to OTM DateTime"; DateTime)
        {
            Caption = 'Sent to OTM DateTime';
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }
}
