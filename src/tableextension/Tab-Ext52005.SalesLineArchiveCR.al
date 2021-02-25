/// <summary>
/// TableExtension SalesLineArchiveCR (ID 52005) extends Record Sales Line Archive.
/// </summary>
tableextension 52005 "SalesLineArchiveCR" extends "Sales Line Archive"
{
    fields
    {
        field(52000; "Sent to OTM"; Boolean)
        {
            Caption = 'Sent to OTM';
            DataClassification = ToBeClassified;
        }
    }
}
