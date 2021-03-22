/// <summary>
/// TableExtension SalesShipmentLineCR (ID 52002) extends Record Sales Shipment Line.
/// </summary>
tableextension 52002 "SalesShipmentLineCR" extends "Sales Shipment Line"
{
    fields
    {
        field(52000; "Sent to OTM"; Boolean)
        {
            Caption = 'Sent to OTM';
            DataClassification = ToBeClassified;
            Editable = false;
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
