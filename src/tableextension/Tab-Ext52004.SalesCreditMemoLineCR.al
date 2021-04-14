/// <summary>
/// TableExtension SalesCreditMemoLineCR (ID 52004) extends Record Sales Cr.Memo Line.
/// </summary>
tableextension 52004 "SalesCreditMemoLineCR" extends "Sales Cr.Memo Line"
{
    fields
    {
        field(52000; "Sent to OTM"; Boolean)
        {
            Caption = 'Sent to OTM';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        //V1.0.0.10
        field(52001; "Warehouse Stock Issue"; Boolean)
        {
            Caption = 'Warehouse Stock Issue';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        
        field(52002; "Cancellation Reason CR"; Code[20])
        {
            Caption = 'Cancellation Reason';
            DataClassification = ToBeClassified;
            TableRelation = "Field Lookup CR".Code where("Lookup Code" = const('CANCELSALES'));
            Editable = false;
        }
    }
}
