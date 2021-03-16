/// <summary>
/// PageExtension PostedSalesShipmentCR (ID 52008) extends Record Posted Sales Shipment.
/// </summary>
pageextension 52008 "PostedSalesShipmentCR" extends "Posted Sales Shipment"
{
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
