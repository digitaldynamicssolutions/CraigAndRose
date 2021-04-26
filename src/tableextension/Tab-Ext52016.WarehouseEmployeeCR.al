tableextension 52016 "WarehouseEmployeeCR" extends "Warehouse Employee"
{
    fields
    {
        field(52000; "Default Routing Assignment CR"; Code[50])
        {
            Caption = 'Default Routing Assignment';
            DataClassification = ToBeClassified;
        }

        field(52001; "Assigned Production Orders CR"; Integer)
        {
            Caption = 'Assigned Production Orders';
            FieldClass = Flowfield;
            CalcFormula = count("Production Order" where("Assigned User ID" = field("User ID")));
            Editable = false;
        }
    }
}
