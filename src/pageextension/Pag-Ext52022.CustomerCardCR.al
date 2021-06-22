/// <summary>
/// PageExtension "CustomerCardCR" (ID 52014) extends Record Customer Card.
/// </summary>
pageextension 52022 CustomerCardCR extends "Customer Card"
{
    layout
    {
        addafter(Blocked)
        {
            field("Auto Release Sales Orders CR"; rec."Auto Release Sales Orders CR")
            {
                Caption = 'Auto Release Sales Orders';
                ApplicationArea = All;
                ToolTip = 'When set any open order will be released based on a set of data criteria. Orders "On Hold" or "To Cancel" will be excluded.';
            }
            field("Ship Only CR"; Rec."Ship Only CR")
            {
                ToolTip = 'Specifies the value of the Ship Only field';
                ApplicationArea = All;
            }
        }
    }
}
