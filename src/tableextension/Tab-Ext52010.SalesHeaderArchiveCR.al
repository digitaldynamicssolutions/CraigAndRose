/// <summary>
/// TableExtension SalesHeaderArchive (ID 52010) extends Record Sales Header Archive.
/// </summary>
tableextension 52010 "SalesHeaderArchiveCR" extends "Sales Header Archive"
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
