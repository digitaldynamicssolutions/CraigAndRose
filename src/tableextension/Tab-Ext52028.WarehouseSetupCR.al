tableextension 52028 "WarehouseSetupCR" extends "Warehouse Setup"
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
        field(52003; "Adjustment Journal Template CR"; Code[10])
        {
            Caption = 'Adjustment Journal Template';
            DataClassification = ToBeClassified;
            TableRelation = "Item Journal Template".Name;
        }
        field(52004; "Adjustment Journal Batch CR"; Code[10])
        {
            Caption = 'Adjustment Journal Batch';
            DataClassification = ToBeClassified;
        }
        field(52005; "Auto. Adj. Number Series CR"; Code[10])
        {
            Caption = 'Auto. Adj. Number Series';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }
}
