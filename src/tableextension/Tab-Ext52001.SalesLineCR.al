/// <summary>
/// TableExtension SalesLineCR (ID 52001) extends Record Sales Line.
/// </summary>
tableextension 52001 "SalesLineCR" extends "Sales Line"
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

            trigger OnValidate()
            var
                FieldLookup: Record "Field Lookup CR";
            begin
                if FieldLookup.Get('CANCELSALES', "Cancellation Reason CR") then begin
                    if FieldLookup."Sales Refund Confirmation" then begin
                        Message('Ensure any refund on this order has been completed');
                    end;
                end;
            end;
        }
    }
}
