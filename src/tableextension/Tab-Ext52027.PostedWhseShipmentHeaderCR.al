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
    }
}
