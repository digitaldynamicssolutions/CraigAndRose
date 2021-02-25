/// <summary>
/// TableExtension SalesInvoiceHeaderCR (ID 52008) extends Record Sales Invoice Header.
/// </summary>
tableextension 52008 "SalesInvoiceHeaderCR" extends "Sales Invoice Header"
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
