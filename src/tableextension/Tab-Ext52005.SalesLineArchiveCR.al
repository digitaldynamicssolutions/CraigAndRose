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
        //V1.0.0.10
        field(52001; "Warehouse Stock Issue"; Boolean)
        {
            Caption = 'Warehouse Stock Issue';
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }
}
