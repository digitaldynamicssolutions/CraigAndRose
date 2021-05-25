pageextension 52029 WarehouseSetupCR extends "Warehouse Setup"
{
    layout
    {
        addafter(Numbering)
        {
            group("Default Shipping Agents")
            {
                field("Def. Ship. Agent (Single) CR"; rec."Def. Ship. Agent (Single) CR")
                {
                    ApplicationArea = All;
                }
                field("Def. Ship. Agent (Multiple) CR"; rec."Def. Ship. Agent (Multiple) CR")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
