codeunit 52008 "Production - Job Queue Func."
{
    TableNo = "Job Queue Entry";

    trigger OnRun()
    begin

        if Rec."Parameter String" = 'CREATEPRODORDER' then begin
            CreateProductionOrders();
        end;

        CreateProductionOrders();
    end;

    local procedure CreateProductionOrders()
    var
        SalesLine: Record "Sales Line";
        item: Record item;
        CompanyInfo: Record "Company Information";
        RelProdOrder: Record "Production Order";
        OpenRelProdOrder: Record "Production Order";
        WarehouseEmployee: Record "Warehouse Employee";
        ManufacturingSetup: Record "Manufacturing Setup";
        Routing: Record "Routing Header";
        ProdOrdersToRefreshTemp: Record "Item Translation" temporary;
        RefreshProductionOrder: Record "Production Order";
        AutoRefreshProdOrdersRep: Report RefreshProdOrderSchedCR;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        AutoRefreshProductionOrders: report RefreshProdOrderSchedCR;
        OnStockQty: Decimal;
        ProdQty: Decimal;
        AssUserID: Code[50];
        AssUserIDProdCount: Integer;
        NewOrdersCreated: Boolean;
    begin
        ManufacturingSetup.get;
        CompanyInfo.get;
        NewOrdersCreated := false;
        SalesLine.SetRange("Document Type", SalesLine."Document Type"::Order);
        SalesLine.SetRange(Type, SalesLine.type::Item);
        SalesLine.SetRange("Warehouse Stock Issue", true);
        SalesLine.Setfilter("Shortcut Dimension 2 Code", 'CRAIG AND ROSE|TOLL');
        SalesLine.Setfilter("Item Category Code", '490|500|590|600|650');
        if SalesLine.findset(false, false) then begin
            repeat
                Clear(OnStockQty);
                Clear(AssUserID);
                Clear(AssUserIDProdCount);
                if item.Get(salesline."No.") then begin
                    if item."Replenishment System" = item."Replenishment System"::"Prod. Order" then begin
                        item.SetFilter("Location Filter", CompanyInfo."Location Code");
                        item.CalcFields("Qty. on Sales Order", "Qty. on Prod. Order", Inventory);
                        OnStockQty := item.Inventory + item."Qty. on Prod. Order";
                        if item."Qty. on Sales Order" > OnStockQty then begin
                            //Create Production Order
                            OpenRelProdOrder.SetRange(Status, OpenRelProdOrder.Status::Released);
                            OpenRelProdOrder.SetRange("Source No.", item."No.");
                            OpenRelProdOrder.SetRange("Creation Date", Today);
                            OpenRelProdOrder.SetRange("Auto-Generated CR", true);
                            OpenRelProdOrder.SetRange("Location Code", CompanyInfo."Location Code");
                            //OpenRelProdOrder.SetRange("Started CR", false);
                            if OpenRelProdOrder.IsEmpty then begin
                                NewOrdersCreated := true;
                                RelProdOrder.InitRecord();
                                RelProdOrder.Validate(Status, RelProdOrder.Status::Released);
                                RelProdOrder.Validate("No.", NoSeriesMgt.GetNextNo(ManufacturingSetup."Released Order Nos.", Today, true));
                                RelProdOrder.Validate("Source Type", RelProdOrder."Source Type"::Item);
                                RelProdOrder.Validate("Source No.", item."No.");
                                RelProdOrder.Insert(true);
                                if item."Production Order Multiple CR" <> 0 then
                                    ProdQty := Round((item."Qty. on Sales Order" - OnStockQty), item."Production Order Multiple CR", '>')
                                else
                                    ProdQty := (item."Qty. on Sales Order" - OnStockQty);

                                RelProdOrder.Validate(Quantity, ProdQty);
                                RelProdOrder."Auto-Generated CR" := true;
                                if Routing.get(item."Routing No.") then begin
                                    RelProdOrder.Validate("Location Code", Routing."Location Code CR");
                                end else
                                    RelProdOrder.Validate("Location Code", CompanyInfo."Location Code");
                                RelProdOrder.modify(true);

                                //Get Assigned User
                                WarehouseEmployee.SetFilter("Default Routing Assignment CR", '%1', '*' + RelProdOrder."Routing No." + '*');
                                if WarehouseEmployee.FindSet(false, false) then begin
                                    repeat
                                        WarehouseEmployee.CalcFields("Assigned Production Orders CR");
                                        if AssUserID = '' then begin
                                            AssUserID := WarehouseEmployee."User ID";
                                            AssUserIDProdCount := WarehouseEmployee."Assigned Production Orders CR";
                                        end else begin
                                            if WarehouseEmployee."Assigned Production Orders CR" < AssUserIDProdCount then begin
                                                AssUserID := WarehouseEmployee."User ID";
                                                AssUserIDProdCount := WarehouseEmployee."Assigned Production Orders CR";
                                            end;
                                        end;
                                    until WarehouseEmployee.next = 0;
                                end;

                                RelProdOrder.validate("Assigned User ID", AssUserID);
                                RelProdOrder.Modify(true);

                                ProdOrdersToRefreshTemp.Init();
                                ProdOrdersToRefreshTemp."Item No." := RelProdOrder."No.";
                                ProdOrdersToRefreshTemp."Language Code" := 'ENG';
                                ProdOrdersToRefreshTemp.insert;
                            end;
                            //end else begin
                            //    if item."Production Order Multiple CR" <> 0 then
                            //        ProdQty := Round((item."Qty. on Sales Order" - OnStockQty), item."Production Order Multiple CR", '>')
                            //    else
                            //        ProdQty := (item."Qty. on Sales Order" - OnStockQty);

                            //    RelProdOrder.Validate(Quantity, ProdQty);
                            //    RelProdOrder.modify(true);
                                
                            //    NewOrdersCreated := true;
                            //    ProdOrdersToRefreshTemp.Init();
                            //    ProdOrdersToRefreshTemp."Item No." := RelProdOrder."No.";
                            //    ProdOrdersToRefreshTemp."Language Code" := 'ENG';
                            //    ProdOrdersToRefreshTemp.insert;
                            //end;
                        end;
                    end;
                end
            until SalesLine.next = 0;
        end;

        if NewOrdersCreated then begin
            if ProdOrdersToRefreshTemp.FindSet(false, false) then begin
                repeat
                    if RefreshProductionOrder.GET(RefreshProductionOrder.Status::Released, ProdOrdersToRefreshTemp."Item No.") then begin
                        Clear(AutoRefreshProdOrdersRep);
                        AutoRefreshProdOrdersRep.InitializeRequest(1, true, true, true, false);
                        AutoRefreshProdOrdersRep.UseRequestPage(false);
                        AutoRefreshProdOrdersRep.SetProdOrder(RefreshProductionOrder."No.");
                        AutoRefreshProdOrdersRep.runmodal;
                    end;
                until ProdOrdersToRefreshTemp.next = 0;
            end;
        end;
    end;

}
