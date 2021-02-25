/// <summary>
/// TableExtension SalesInvoiceLineCR (ID 52003) extends Record Sales Invoice Line.
/// </summary>
tableextension 52003 "SalesInvoiceLineCR" extends "Sales Invoice Line"
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
