codeunit 52007 "ProductionSubCR"
{

    [EventSubscriber(ObjectType::Report, Report::"Refresh Production Order", 'OnAfterRefreshProdOrder', '', true, true)]

    /// <summary>
    /// SetLocationFromRouting.
    /// </summary>
    /// <param name="ProductionOrder">VAR Record "Production Order".</param>
    procedure SetLocationFromRouting(var ProductionOrder: Record "Production Order")
    var
        Routing: Record "Routing Header";
        ProdOrderLine: Record "Prod. Order Line";
    begin
        if Routing.get(ProductionOrder."Routing No.") then begin
            if ProductionOrder."Location Code" = '' then begin
                ProductionOrder.validate("Location Code", Routing."Location Code CR");
                ProductionOrder.Modify();
            
                ProdOrderLine.setrange("Prod. Order No.", ProductionOrder."No.");
                //ProdOrderLine.SetRange("Routing No.", ProductionOrder."Routing No.");
                ProdOrderLine.SetFilter("Location Code", '');
                if ProdOrderLine.FindSet(true, false) then begin
                    repeat
                        ProdOrderLine.Validate("Location Code", Routing."Location Code CR");
                        ProdOrderLine.Modify();
                    until ProdOrderLine.Next = 0;
                end;
            end;
        end;
    end;
}
