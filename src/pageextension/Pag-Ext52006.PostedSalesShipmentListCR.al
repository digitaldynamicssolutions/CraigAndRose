/// <summary>
/// PageExtension "PostedSalesShipmentListCR" (ID 52006) extends Record Posted Sales Shipments.
/// </summary>
pageextension 52006 PostedSalesShipmentListCR extends "Posted Sales Shipments"
{
    layout
    {
        addafter("Location Code")
        {
            field("Order No."; rec."Order No.")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        addafter("&Shipment")
        {
            action(OrderProgressEntriesCR)
            {
                Caption = '&Order Progress Entries';
                ApplicationArea = All;
                Image = EntriesList;
                //Promoted = true;
                //PromotedCategory = Category6;
                //PromotedIsBig = true;

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
