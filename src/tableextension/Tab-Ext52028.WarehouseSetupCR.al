tableextension 52028 WarehouseSetupCR extends "Warehouse Setup"
{
    fields
    {
        field(52000; "Def. Ship. Agent (Single) CR"; Code[10])
        {
            Caption = 'Default Shipping Agent (Single)';
            DataClassification = ToBeClassified;
            TableRelation = "Shipping Agent";
        }
        field(52001; "Def. Ship. Agent (Multiple) CR"; Code[10])
        {
            Caption = 'Default Shipping Agent (Multiple)';
            DataClassification = ToBeClassified;
            TableRelation = "Shipping Agent";
        }
    }
}
