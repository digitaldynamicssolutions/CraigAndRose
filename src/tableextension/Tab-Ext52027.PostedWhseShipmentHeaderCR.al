tableextension 52027 "PostedWhseShipmentHeaderCR" extends "Posted Whse. Shipment Header"
{
    fields
    {
        field(52000; "Source Global Dimension 1 CR"; Code[20])
        {
            Caption = 'Source Global Dimension 1';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(52001; "Source Global Dimension 2 CR"; Code[20])
        {
            Caption = 'Source Global Dimension 2';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(52002; "Source Order No. CR"; Date)
        {
            Caption = 'Source Order No.';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(52003; "Source Order Date CR"; Date)
        {
            Caption = 'Source Order Date';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(52004; "Source Ship-to Name CR"; Text[50])
        {
            Caption = 'Source Ship-to Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(52005; "Customer Posting Group CR"; Code[10])
        {
            Caption = 'Customer Posting Group';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(52006; "Source Customer Group CR"; Code[20])
        {
            Caption = 'Source Customer Group';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(52007; "Ship-to Name 2 CR"; Text[50])
        {
            Caption = 'Ship-to Name 2';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(52008; "Ship-to Address CR"; Text[100])
        {
            Caption = 'Ship-to Address';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(52009; "Ship-to Address 2 CR"; Text[50])
        {
            Caption = 'Ship-to Address 2';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(52010; "Ship-to City CR"; Text[30])
        {
            Caption = 'Ship-to City';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(52011; "Ship-to Post Code CR"; Code[20])
        {
            Caption = 'Ship-to Post Code';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(52012; "Ship-to County CR"; Text[30])
        {
            CaptionClass = '5,1,' + "Ship-to Country/Region Code CR";
            Caption = 'Ship-to County';
        }
        field(52013; "Ship-to Country/Region Code CR"; Code[10])
        {
            Caption = 'Ship-to Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(52014; "Ship-to Contact CR"; Text[100])
        {
            Caption = 'Ship-to Contact';
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }
}
