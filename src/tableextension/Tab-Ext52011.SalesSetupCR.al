tableextension 52011 "SalesSetupCR" extends "Sales & Receivables Setup"
{
    fields
    {
        field(52000; "OTM Order E-mail Address"; Text[100])
        {
            Caption = 'OTM Order E-mail Address';
            DataClassification = ToBeClassified;
        }
        field(52001; "OTM E-mail Subject Text"; Text[100])
        {
            Caption = 'OTM E-mail Body Text';
            DataClassification = ToBeClassified;
        }
        field(52002; "OTM E-mail Body Text"; Text[100])
        {
            Caption = 'OTM E-mail Body Text';
            DataClassification = ToBeClassified;
        }
        field(52003; "OTM Order Posting Delay (Days)"; DateFormula)
        {
            Caption = 'OTM Order Posting Delay (Days)';
            DataClassification = ToBeClassified;       
        }
        field(52004; "OTM Location Code"; Code[10])
        {
            Caption = 'OTM Location Code';
            DataClassification = ToBeClassified;
            TableRelation = Location;      
        }

    }
}
