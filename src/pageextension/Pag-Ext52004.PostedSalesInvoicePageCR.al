/// <summary>
/// PageExtension PostedSalesInvoicetCR (ID 52004) extends Record Posted Sales Invoice.
/// </summary>
pageextension 52004 "PostedSalesInvoicePageCR" extends "Posted Sales Invoice"
{

    layout
    {
        addafter("Your Reference")
        {
            field("Order Date"; Rec."Order Date")
            {
                ApplicationArea = All;
                StyleExpr = 'Strong';
            }
        }
    }

    actions
    {
        addafter("&Navigate")
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
                    OrderProgressEntries.SetRange("Original Order No.", rec."Order No.");
                    OrderProgressEntriesList.SetTableView(OrderProgressEntries);
                    OrderProgressEntriesList.Run();
                end;
            }
        }
    }
}