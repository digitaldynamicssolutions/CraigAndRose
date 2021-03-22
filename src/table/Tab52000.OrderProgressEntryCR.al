/// <summary>
/// Table Order Progress Entry CR (ID 52000).
/// </summary>
table 52000 "Order Progress Entry CR"
{
    Caption = 'Order Progress Entry';
    DataClassification = ToBeClassified;

    fields
    {
        field(10; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(20; "Status DateTime"; DateTime)
        {
            Caption = 'Status DateTime';
            DataClassification = ToBeClassified;
        }
        field(30; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = ToBeClassified;
        }

        field(40; Status; Enum "Order Progress CR")
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;
        }
        field(50; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = ToBeClassified;
        }
        field(60; "Original Order No."; code[20])
        {
            Caption = 'Original Order No.';
            DataClassification = ToBeClassified;
        }
        field(70; "Location Code"; code[20])
        {
            Caption = 'Location Code';
            DataClassification = ToBeClassified;
        }
        field(80; "External Document No."; code[35])
        {
            Caption = 'External Document No.';
            DataClassification = ToBeClassified;
        }
        field(90; "Package Tracking Number"; code[35])
        {
            Caption = 'Package Tracking Number';
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Shipment Header"."Package Tracking No." where("External Document No." = field("External Document No.")));
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

}
