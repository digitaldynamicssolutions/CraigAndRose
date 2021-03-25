/// <summary>
/// TableExtension "RegWarehouseActivityLineCR" (ID 52014) extends Record Registered Whse. Activity Line.
/// </summary>
tableextension 52014 RegWarehouseActivityLineCR extends "Registered Whse. Activity Line"
{
    fields
    {
        field(52000; "Registered Date"; Date)
        {
            Caption = 'Registered Date';
            FieldClass = FlowField;
            CalcFormula = lookup("Registered Whse. Activity Hdr."."Registering Date" WHERE ("No." = field("No.")));
            Editable = false;
        }
    }
}
