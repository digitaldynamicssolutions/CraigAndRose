table 52001 "Field Lookup CR"
{
    Caption = 'Field Lookup';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Field Lookup";
    LookupPageId = "Field Lookup";
    
    fields
    {
        field(1; "Lookup Code"; Code[20])
        {
            Caption = 'Lookup Code';
            DataClassification = ToBeClassified;
        }
        field(2; Code; Code[20])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
        }
        field(3; Description; Text[50])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(4; Squence; Integer)
        {
            Caption = 'Squence';
            DataClassification = ToBeClassified;
        }
        field(5; "Sales Refund Confirmation"; Boolean)
        {
            Caption = 'Sales Refund Confirmation';
            DataClassification = ToBeClassified;
        }
    }
    
    keys
    {
        key(PK; "Lookup Code",Code)
        {
            Clustered = true;
        }
        key(Key2; "Lookup Code", Squence, Code)
        {

        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; Code,Description)
        {

        }

    }
    
}