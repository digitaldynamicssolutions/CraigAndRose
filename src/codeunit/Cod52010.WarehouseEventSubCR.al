codeunit 52010 "WarehouseEventSubCR"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Create Source Document", 'OnAfterCreateShptLineFromSalesLine', '', true, true)]

    procedure UpdateShipmentHeader(SalesHeader: Record "Sales Header"; WarehouseShipmentHeader: Record "Warehouse Shipment Header")
    var
    DimSetEntry: Record "Dimension Set Entry";
    begin
        WarehouseShipmentHeader.validate("Source Order No. CR", SalesHeader."No.");
        WarehouseShipmentHeader.Validate("Source Order Date CR", SalesHeader."Order Date");
        WarehouseShipmentHeader.Validate("Source Global Dimension 1 CR", SalesHeader."Shortcut Dimension 1 Code");
        WarehouseShipmentHeader.Validate("Source Global Dimension 2 CR", SalesHeader."Shortcut Dimension 2 Code");
        WarehouseShipmentHeader.Validate("Source Ship-to Name CR", SalesHeader."Ship-to Name");
        WarehouseShipmentHeader.Validate("Source Ship-to Name 2 CR", SalesHeader."Ship-to Name 2");
        WarehouseShipmentHeader.Validate("Source Ship-to Address CR", SalesHeader."Ship-to Address");
        WarehouseShipmentHeader.Validate("Source Ship-to Address 2 CR", SalesHeader."Ship-to Address 2");
        WarehouseShipmentHeader.Validate("Source Ship-to City CR", SalesHeader."Ship-to City");
        WarehouseShipmentHeader.Validate("Source Ship-to County CR", SalesHeader."Ship-to County");
        WarehouseShipmentHeader.Validate("Source Ship-to Post Code CR", SalesHeader."Ship-to Post Code");
        WarehouseShipmentHeader.Validate("Source Ship-to Country/Reg CR", SalesHeader."Ship-to Country/Region Code");
        WarehouseShipmentHeader.Validate("Source Ship-to Contact CR", SalesHeader."Ship-to Contact");
        WarehouseShipmentHeader.Validate("Customer Posting Group CR", SalesHeader."Customer Posting Group");

        DimSetEntry.SetRange("Dimension Set ID", SalesHeader."Dimension Set ID");
        DimSetEntry.SetRange("Dimension Code", 'CUSTOMERGROUP');
        if DimSetEntry.FindFirst() then begin
            WarehouseShipmentHeader.validate("Source Customer Group CR", DimSetEntry."Dimension Value Code");
        end;

        WarehouseShipmentHeader.Modify(false);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Create Pick", 'OnAfterWhseActivLineInsert', '', true, true)]

    procedure UpdateActivityHeader(var WarehouseActivityLine: Record "Warehouse Activity Line")
    var
        WarehouseActivityHeader: Record "Warehouse Activity Header";
        WarehouseShipmentHeader: Record "Warehouse Shipment Header";
    begin
        if WarehouseActivityLine."Source Document" = WarehouseActivityLine."Source Document"::"Sales Order" then begin
            WarehouseShipmentHeader.SetRange("Source Order No. CR", WarehouseActivityLine."Source No.");
            if WarehouseShipmentHeader.FindFirst() then begin
                if WarehouseActivityHeader.get(WarehouseActivityLine."Activity Type", WarehouseActivityLine."No.") then begin

                    WarehouseActivityHeader.validate("Source Document No. CR", WarehouseShipmentHeader."Source Order No. CR");
                    WarehouseActivityHeader.Validate("Source Order Date CR", WarehouseShipmentHeader."Source Order Date CR");
                    WarehouseActivityHeader.Validate("Source Global Dimension 1 CR", WarehouseShipmentHeader."Source Global Dimension 1 CR");
                    WarehouseActivityHeader.Validate("Source Global Dimension 2 CR", WarehouseShipmentHeader."Source Global Dimension 2 CR");
                    WarehouseActivityHeader.Validate("Source Ship-to Name CR", WarehouseShipmentHeader."Source Ship-to Name CR");
                    WarehouseActivityHeader.Validate("Customer Posting Group CR", WarehouseShipmentHeader."Customer Posting Group CR");
                    WarehouseActivityHeader.Validate("Source Customer Group CR", WarehouseShipmentHeader."Source Customer Group CR");
                    WarehouseActivityHeader.Modify(false);
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
