tableextension 52019 "Purchase Invoice Line CR" extends "Purch. Inv. Line"
{
    fields
    {
        field(52000; "Catalogue Code"; Code[20])
        {
            Caption = 'Catalogue Code';
            DataClassification = ToBeClassified;
        }
    }
}
