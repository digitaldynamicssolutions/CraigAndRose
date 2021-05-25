codeunit 52010 "WarehouseEventSubCR"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Create Source Document", 'OnAfterCreateShptLineFromSalesLine', '', true, true)]

    procedure UpdateShipmentHeader(SalesHeader: Record "Sales Header"; WarehouseShipmentHeader: Record "Warehouse Shipment Header")
    var
    begin
        WarehouseShipmentHeader.validate("Source Order No. CR", SalesHeader."No.");
        WarehouseShipmentHeader.Validate("Source Order Date CR", SalesHeader."Order Date");
        WarehouseShipmentHeader.Validate("Source Global Dimension 1 CR", SalesHeader."Shortcut Dimension 1 Code");
        WarehouseShipmentHeader.Validate("Source Global Dimension 2 CR", SalesHeader."Shortcut Dimension 2 Code");
        WarehouseShipmentHeader.Validate("Source Ship-to Name CR", SalesHeader."Ship-to Name");
        WarehouseShipmentHeader.Validate("Customer Posting Group CR", SalesHeader."Customer Posting Group");
        WarehouseShipmentHeader.Modify(false);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Create Pick", 'OnAfterWhseActivLineInsert', '', true, true)]

    procedure UpdateActivityHeader(var WarehouseActivityLine: Record "Warehouse Activity Line")
    var
        WarehouseAtivityHeader: Record "Warehouse Activity Header";
        WarehouseShipmentHeader: Record "Warehouse Shipment Header";
    begin
        if WarehouseActivityLine."Source Document" = WarehouseActivityLine."Source Document"::"Sales Order" then begin
            WarehouseShipmentHeader.SetRange("Source Order No. CR", WarehouseActivityLine."Source No.");
            if WarehouseShipmentHeader.FindFirst() then begin
                if WarehouseAtivityHeader.get(WarehouseActivityLine."Activity Type", WarehouseActivityLine."No.") then begin

                    WarehouseAtivityHeader.validate("Source Order No. CR", WarehouseShipmentHeader."Source Order No. CR");
                    WarehouseAtivityHeader.Validate("Source Order Date CR", WarehouseShipmentHeader."Source Order Date CR");
                    WarehouseAtivityHeader.Validate("Source Global Dimension 1 CR", WarehouseShipmentHeader."Source Global Dimension 1 CR");
                    WarehouseAtivityHeader.Validate("Source Global Dimension 2 CR", WarehouseShipmentHeader."Source Global Dimension 2 CR");
                    WarehouseAtivityHeader.Validate("Source Ship-to Name CR", WarehouseShipmentHeader."Source Ship-to Name CR");
                    WarehouseAtivityHeader.Validate("Customer Posting Group CR", WarehouseShipmentHeader."Customer Posting Group CR");
                    WarehouseAtivityHeader.Modify(false);
                end;
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Warehouse Shipment Header", 'OnAfterValidateEvent', 'No. of Packages CSAITMN', true, true)]

    procedure UpdateAgent(var Rec: Record "Warehouse Shipment Header"; var xRec: Record "Warehouse Shipment Header")
    var
        WarehouseSetup: record "Warehouse Setup";
        ShippingAgentService: Record "Shipping Agent Services";
    begin
        WarehouseSetup.Get;

        if (WarehouseSetup."Def. Ship. Agent (Multiple) CR" <> '') and (WarehouseSetup."Def. Ship. Agent (Single) CR" <> '') then begin
            if rec."No. of Packages CSAITMN" > 1 then begin
                rec.Validate("Shipping Agent Code", WarehouseSetup."Def. Ship. Agent (Multiple) CR");
                if ShippingAgentService.Get(WarehouseSetup."Def. Ship. Agent (Multiple) CR", xrec."Shipping Agent Service Code") then
                    rec.validate("Shipping Agent Service Code", xrec."Shipping Agent Service Code");
                rec.Modify(true);
            end else begin
                rec.Validate("Shipping Agent Code", WarehouseSetup."Def. Ship. Agent (Single) CR");
                if ShippingAgentService.Get(WarehouseSetup."Def. Ship. Agent (Single) CR", xrec."Shipping Agent Service Code") then
                    rec.validate("Shipping Agent Service Code", xrec."Shipping Agent Service Code");
                rec.Modify(true);
            end;
        end;
    end;
}
