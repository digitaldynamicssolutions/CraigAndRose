pageextension 52029 "WarehouseSetupCR" extends "Warehouse Setup"
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
            group(Automation)
            {
                field("Adjustment Journal Template CR"; rec."Adjustment Journal Template CR")
                {
                    ApplicationArea = All;
                }
                field("Adjustment Journal Batch CR"; Rec."Adjustment Journal Batch CR")
                {
                    ApplicationArea = All;
                }
                field("Auto. Adj. Number Series CR"; Rec."Auto. Adj. Number Series CR")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
