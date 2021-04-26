pageextension 52020 "WarehouseEmployeeListCR" extends "Warehouse Employees"
{
    layout
    {
        addafter("ADCS User")
        {
            field("Default Routing Assignment CR"; rec."Default Routing Assignment CR")
            {
                Caption = 'Default Routing Assignment';
                ApplicationArea = All;
            }
            field("Assigned Production Orders CR"; Rec."Assigned Production Orders CR")
            {
                Caption = 'Assigned Production Orders';
                ApplicationArea = All;
            }
        }
    }
}