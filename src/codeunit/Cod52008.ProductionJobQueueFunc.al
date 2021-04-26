codeunit 52008 "Production - Job Queue Func."
{
    TableNo = "Job Queue Entry";

    trigger OnRun()
    begin
        //DelPro();
        if Rec."Parameter String" = 'CREATEPRODORDER' then begin
            CreateProductionOrders();
            RefreshProdOrders();
        end;
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
        NoSeriesMgt: Codeunit NoSeriesManagement;
        AutoRefreshProductionOrders: report RefreshProdOrderSchedCR;
        OnStockQty: Decimal;
        ProdQty: Decimal;
        AssUserID: Code[50];
        AssUserIDProdCount: Integer;

    begin
        ManufacturingSetup.get;
        CompanyInfo.get;
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
                            if OpenRelProdOrder.IsEmpty then begin

                                RelProdOrder.InitRecord();
                                RelProdOrder.Validate(Status, RelProdOrder.Status::Released);
                                RelProdOrder.Validate("No.", NoSeriesMgt.GetNextNo(ManufacturingSetup."Released Order Nos.", Today, true));
                                RelProdOrder.Validate("Source Type", RelProdOrder."Source Type"::Item);
                                RelProdOrder.Validate("Source No.", item."No.");
                                if item."Production Order Multiple CR" <> 0 then
                                    ProdQty := Round((item."Qty. on Sales Order" - OnStockQty), item."Production Order Multiple CR", '>')
                                else
                                    ProdQty := (item."Qty. on Sales Order" - OnStockQty);

                                RelProdOrder.Validate(Quantity, ProdQty);
                                RelProdOrder.validate("Assigned User ID", AssUserID);
                                RelProdOrder.Insert(true);

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
                            end;
                        end;
                    end;
                end
            until SalesLine.next = 0;
        end;
    end;

    local procedure RefreshProdOrders()
    var
        ProductionOrder: Record "Production Order";
        AutoRefreshProdOrders: Report RefreshProdOrderSchedCR;
    begin
        ProductionOrder.SetRange("Creation Date", TODAY);
        ProductionOrder.SetFilter("Assigned User ID", '<>%1', '');
        if ProductionOrder.FindSet() then begin
            repeat
                Clear(AutoRefreshProdOrders);
                AutoRefreshProdOrders.InitializeRequest(1, true, true, true, false);
                AutoRefreshProdOrders.UseRequestPage(false);
                AutoRefreshProdOrders.SetTableView(ProductionOrder);
                AutoRefreshProdOrders.runmodal;
            until ProductionOrder.next = 0;
        end;
    end;


    local procedure DelPro()
    var
        Prod: Record "Production Order";
    begin
        Prod.Setfilter("Creation Date", '230421D');
        if Prod.FindFirst() then
            prod.DeleteAll(true);
    end;
}
