/// <summary>
/// TableExtension SalesCreditMemoLineCR (ID 52004) extends Record Sales Cr.Memo Line.
/// </summary>
tableextension 52004 "SalesCreditMemoLineCR" extends "Sales Cr.Memo Line"
{
    fields
    {
        field(52000; "Sent to OTM"; Boolean)
        {
            Caption = 'Sent to OTM';
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }
}
