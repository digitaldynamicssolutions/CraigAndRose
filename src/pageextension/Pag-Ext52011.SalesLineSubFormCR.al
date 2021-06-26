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
        addafter("Warehouse Stock Issue")
        {
            field("Cancellation Reason CR"; rec."Cancellation Reason CR")
            {
                Caption = 'Cancellation Reason';
                ApplicationArea = All;
            }
        }

        modify(Quantity)
        {
        trigger OnAfterValidate();
        begin
            CurrPage.Update();
        end;
        }
    }

    actions
    {
        addafter(SelectMultiItems)
        {
            action("Delete Cancelled Line")
            {
                Image = DeleteRow;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    FromCancelButton := true;
                    SalesFunctionsCR.CancelSalesOrderLine(Rec."Document No.");
                end;
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

    trigger OnDeleteRecord(): Boolean
    begin
        if not FromCancelButton then
            Error('You must use the cancel line functionality.');
    end;

    var
        LineStyleExprText: Text[20];
        FromCancelButton: Boolean;
        SalesFunctionsCR: Codeunit "Sales Functions CR";

    
}
