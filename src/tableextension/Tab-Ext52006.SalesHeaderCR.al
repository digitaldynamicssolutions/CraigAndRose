/// <summary>
/// TableExtension SalesHeaderCR (ID 52006) extends Record Sales Header.
/// </summary>
tableextension 52006 "SalesHeaderCR" extends "Sales Header"
{
    fields
    {
        field(52000; "Sent to OTM"; Boolean)
        {
            Caption = 'Sent to OTM';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(52001; "Sent to OTM DateTime"; DateTime)
        {
            Caption = 'Sent to OTM DateTime';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(52002; "Progress Status CR"; enum "Order Progress CR")
        {
            Caption = 'Progress Status';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = max("Order Progress Entry CR".Status WHERE("Entry No." = field("Last Progress Entry No. CR")));
        }
        field(5200; "Last Progress Entry No. CR"; Integer)
        {
            Caption = 'Last Progress Entry No.';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = max("Order Progress Entry CR"."Entry No." WHERE("Original Order No." = FIELD("No.")));
        }
    }
}
