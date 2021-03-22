/// <summary>
/// PageExtension "SalesLineSubFormCR" (ID 52011) extends Record Sales Lines Subform.
/// </summary>
pageextension 52011 SalesLineSubFormCR extends "Sales Order Subform"
{
    layout
    {
        modify("No.")
        {
            Style = Strong;
            StyleExpr = LineStyleExprText;
        }
        addafter(Quantity)
        {
            field("Warehouse Stock Issue"; Rec."Warehouse Stock Issue")
            {
                Caption = 'Stock Issue';
                ApplicationArea = All;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        if rec."Warehouse Stock Issue" then begin
            LineStyleExprText := 'Unfavorable';
        end else begin
            LineStyleExprText := 'Favorable'
        end;
    end;

    var
        LineStyleExprText: Text[20];
}
