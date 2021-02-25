/// <summary>
/// TableExtension SalesShipmentHeaderCR (ID 52007) extends Record Sales Shipment Header.
/// </summary>
tableextension 52007 "SalesShipmentHeaderCR" extends "Sales Shipment Header"
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
