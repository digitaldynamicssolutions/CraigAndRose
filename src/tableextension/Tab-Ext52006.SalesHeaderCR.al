/// <summary>
/// TableExtension SalesHeaderCR (ID 52006) extends Record Sales Header.
/// </summary>
tableextension 52006 "SalesHeaderCR" extends "Sales Header"
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
