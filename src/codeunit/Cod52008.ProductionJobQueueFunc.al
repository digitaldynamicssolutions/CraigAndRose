codeunit 52008 "Production - Job Queue Func."
{
    TableNo = "Job Queue Entry";

    trigger OnRun()
    begin

        if Rec."Parameter String" = 'CREATEPRODORDER' then begin
            CreateProductionOrders();
        end;

        if Rec."Parameter String" = 'REFRESHPRODORDERS' then begin
            RefreshProductionOrders();
        end;

        RefreshProductionOrders();
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
                            OpenRelProdOrder.SetRange("Started CR", false);
                            //if OpenRelProdOrder.IsEmpty then begin
                            if not OpenRelProdOrder.findfirst then begin
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

                            end else begin
                                if item."Production Order Multiple CR" <> 0 then
                                    ProdQty := Round((item."Qty. on Sales Order" - OnStockQty), item."Production Order Multiple CR", '>')
                                else
                                    ProdQty := (item."Qty. on Sales Order" - OnStockQty);
                                OpenRelProdOrder.Validate(Quantity, ProdQty);
                                OpenRelProdOrder.modify(true);
                            end;
                        end;
                    end;
                end
            until SalesLine.next = 0;
        end;
    end;

    local procedure RefreshProductionOrders()
    var
        CompanyInfo: Record "Company Information";
        ProdOrder: Record "Production Order";
        RefreshProductionOrder: Record "Production Order";
        AutoRefreshProdOrdersRep: Report RefreshProdOrderSchedCR;
        AutoRefreshProductionOrders: report RefreshProdOrderSchedCR;
    begin
        CompanyInfo.Get();
        ProdOrder.SetRange("Auto-Generated CR", true);
        ProdOrder.SetRange("Creation Date", today);
        ProdOrder.SetRange("Started CR", false);
        ProdOrder.SetRange("Source Type", ProdOrder."Source Type"::Item);
        ProdOrder.SetRange("Location Code", CompanyInfo."Location Code");
        if ProdOrder.FindSet() then begin
            repeat
                if RefreshProductionOrder.GET(RefreshProductionOrder.Status::Released, ProdOrder."No.") then begin           
                    Clear(AutoRefreshProdOrdersRep);
                    AutoRefreshProdOrdersRep.InitializeRequest(1, true, true, true, false);
                    AutoRefreshProdOrdersRep.UseRequestPage(false);
                    AutoRefreshProdOrdersRep.SetProdOrder(RefreshProductionOrder."No.");
                    AutoRefreshProdOrdersRep.runmodal;
                end;
                Commit();
            until ProdOrder.next = 0;
        end;
    end;

}
