table 52002 "Catalogue Codes CR"
{
    Caption = 'Catalogue Codes CR';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
        }
        field(2; Description; Code[50])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(3; "Purchase G/L Account"; Code[20])
        {
            Caption = 'Purchase G/L Account';
            DataClassification = ToBeClassified;
            TableRelation  = "G/L Account"."No." where("Direct Posting" = const(true));
        }
    }
    
    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }

    }

    fieldgroups
    {
        fieldgroup(DrillDown; Code, Description, "Purchase G/L Account")
        {
            
        }
    }
}
