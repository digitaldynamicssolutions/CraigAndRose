/// <summary>
/// PageExtension PostedSalesInvoicetListCR (ID 52005) extends Record Posted Sales Invoices.
/// </summary>
pageextension 52005 "PostedSalesInvoicetListCR" extends "Posted Sales Invoices"
{
    actions
    {
        addafter(Invoice)
        {
            action(OrderProgressEntriesCR)
            {
                Caption = '&Order Progress Entries';
                ApplicationArea = All;
                Image = EntriesList;
                Promoted = true;
                PromotedCategory = Category4;
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