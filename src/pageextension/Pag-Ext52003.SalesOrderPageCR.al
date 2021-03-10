/// <summary>
/// PageExtension "SalesOrderPageCR" (ID 52003) extends Record Sales Order.
/// </summary>
pageextension 52003 SalesOrderPageCR extends "Sales Order"
{
    layout
    {
        addafter(Status)
        {
            field("Progress Status CR"; Rec."Progress Status CR")
            {
                ApplicationArea = All;
                ToolTip = 'This displays the current shipping progress of this order';
                StyleExpr = 'Strong';
            }
        }
    }

    actions
    {
        addafter(Invoices)
        {
            action(OrderProgressEntriesCR)
            {
                Caption = '&Order Progress Entries';
                ApplicationArea = All;
                Image = EntriesList;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    OrderProgressEntries: Record "Order Progress Entry CR";
                    OrderProgressEntriesList: Page "Order Progress Status List CR";
                begin
                    OrderProgressEntries.SetRange("Original Order No.", rec."No.");
                    OrderProgressEntriesList.SetTableView(OrderProgressEntries);
                    OrderProgressEntriesList.Run();
                end;
            }
        }
    }

}
