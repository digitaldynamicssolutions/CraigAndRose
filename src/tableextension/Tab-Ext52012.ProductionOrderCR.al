/// <summary>
/// TableExtension Production Order CR (ID 52012) extends Record Production Order.
/// </summary>
tableextension 52012 "Production Order CR" extends "Production Order"
{
    fields
    {
        field(52000; "Total Finished Quantity CR"; Decimal)
        {
            Caption = 'Total Finished Quantity';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Prod. Order Line"."Finished Quantity" where("Prod. Order No." = field("No.")));
        }

        field(52001; "Auto-Generated CR"; Boolean)
        {
            Caption = 'Auto-Generated';
            DataClassification = ToBeClassified;
        }
    }
}
