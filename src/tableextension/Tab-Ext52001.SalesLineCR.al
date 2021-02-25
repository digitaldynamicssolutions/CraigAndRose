/// <summary>
/// TableExtension SalesLineCR (ID 52001) extends Record Sales Line.
/// </summary>
tableextension 52001 "SalesLineCR" extends "Sales Line"
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
