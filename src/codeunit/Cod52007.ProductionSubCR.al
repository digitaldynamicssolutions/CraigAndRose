codeunit 52007 "ProductionSubCR"
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Prod. Order Status Management", 'OnBeforeCheckBeforeFinishProdOrder', '', true, true)]

    /// <summary>
    /// HasFinishedQty.
    /// </summary>
    /// <param name="ProductionOrder">VAR Record "Production Order".</param>
    procedure HasFinishedQty(var ProductionOrder: Record "Production Order")
    begin
        if ProductionOrder.Status = ProductionOrder.Status::Released then begin
            ProductionOrder.CalcFields("Total Finished Quantity CR");
            if ProductionOrder."Total Finished Quantity CR" = 0 then
                error('You are unable to finish a production order with zero finished quantity.')
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Production Order", 'OnAfterValidateEvent', 'Quantity', true, true)]

    /// <summary>
    /// SetLocationFromRouting.
    /// </summary>
    /// <param name="ProductionOrder">VAR Record "Production Order".</param>
    procedure SetLocationFromRoutingOnItem(var Rec: Record "Production Order")
    var
        Routing: Record "Routing Header";
        ProdOrderLine: Record "Prod. Order Line";
    begin
        if Routing.get(Rec."Routing No.") then begin
            if Rec."Location Code" = '' then begin
                Rec.validate("Location Code", Routing."Location Code CR");
                Rec.Modify();

                ProdOrderLine.setrange("Prod. Order No.", Rec."No.");
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
