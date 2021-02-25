/// <summary>
/// TableExtension Item Table - CR (ID 50100) extends Record Item.
/// </summary>
tableextension 52000 "ItemTableCR" extends Item
{
    fields
    {
        field(52000; "Default Fulfillment Location"; Code[20])
        {
            Caption = 'Default Fulfillment Location';
            TableRelation = Location;
            DataClassification = ToBeClassified;
        }
    }
}
