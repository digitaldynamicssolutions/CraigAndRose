/// <summary>
/// Codeunit Order Progress Subscriptions CR (ID 52003).
/// </summary>
codeunit 52003 "Order Progress Sub. CR"
{
    var
        SalesHeader: Record "Sales Header";

    /// <summary>
    /// InsertOrderProgress.
    /// </summary>
    /// <param name="pDocNo">VAR Code[20].</param>
    /// <param name="pOrderNo">Code[20].</param>
    /// <param name="pProgressStatus">Enum "Order Progress CR".</param>
    /// <param name="pLocationCode">code[10].</param>
    /// <param name="pExtDocNo">Code[35].</param>
    procedure InsertOrderProgress(var pDocNo: Code[20]; pOrderNo: Code[20]; pProgressStatus: Enum "Order Progress CR"; pLocationCode: code[10]; pExtDocNo: Code[35]);
    var
        OrderProgressEntry: Record "Order Progress Entry CR";
    begin
        OrderProgressEntry."Status DateTime" := CurrentDateTime;
        OrderProgressEntry."Document No." := pDocNo;
        OrderProgressEntry.Status := pProgressStatus;
        OrderProgressEntry."Original Order No." := pOrderNo;
        OrderProgressEntry."User ID" := UserId;
        OrderProgressEntry."Location Code" := pLocationCode;
        OrderProgressEntry."External Document No." := pExtDocNo;
        OrderProgressEntry.Insert(true);
    end;

    /// <summary>
    /// InsertOrderProgress_Created.
    /// </summary>
    /// <param name="Rec">VAR Record "Sales Header".</param>
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterInsertEvent', '', true, true)]
    procedure InsertOrderProgress_Created(var Rec: Record "Sales Header")
    var
        ProgressStatus: Enum "Order Progress CR";

    begin
        if SalesHeader.IsTemporary then
            exit;

        if SalesHeader.Get(Rec."Document Type", Rec."No.") then begin
            if SalesHeader."Document Type" = SalesHeader."Document Type"::Order then begin
                InsertOrderProgress(SalesHeader."No.", SalesHeader."No.", ProgressStatus::Created, SalesHeader."Location Code", SalesHeader."External Document No.");
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, database::"Sales Invoice Header", 'OnAfterInsertEvent', '', true, true)]

    /// <summary>
    /// InsertOrderProgress_InvoicePost.
    /// </summary>
    /// <param name="Rec">VAR Record "Sales Invoice Header".</param>
    procedure InsertOrderProgress_InvoicePost(var Rec: Record "Sales Invoice Header")
    var
        ProgressStatus: Enum "Order Progress CR";
    begin
        if SalesHeader.get(SalesHeader."Document Type"::Order, Rec."Order No.") then begin
            InsertOrderProgress(Rec."No.", SalesHeader."No.", ProgressStatus::Invoiced, SalesHeader."Location Code", SalesHeader."External Document No.");
        end;
    end;


    [EventSubscriber(ObjectType::Table, Database::"Warehouse Activity Header", 'OnAfterDeleteEvent', '', true, true)]
    /// <summary>
    /// InsertOrderProgress_PickCancelled.
    /// </summary>
    /// <param name="Rec">VAR Record "Warehouse Activity Header".</param>
    procedure InsertOrderProgress_PickCancelled(var Rec: Record "Warehouse Activity Header")
    var
        ProgressStatus: Enum "Order Progress CR";
        RegWhseActivityHdr: Record "Registered Whse. Activity Hdr.";
    begin
        if rec.IsTemporary then
            exit;

        RegWhseActivityHdr.SetRange("Whse. Activity No.", rec."No.");
        if RegWhseActivityHdr.IsEmpty then begin
            if SalesHeader.get(SalesHeader."Document Type"::Order, rec."Source No.") then begin
                InsertOrderProgress(rec."No.", SalesHeader."No.", ProgressStatus::"Pick Cancelled", SalesHeader."Location Code", SalesHeader."External Document No.");
            end;
        end

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Create Pick", 'OnAfterWhseActivLineInsert', '', true, true)]
    /// <summary>
    /// InsertOrderProgress_PickCreated.
    /// </summary>
    /// <param name="WarehouseActivityLine">VAR Record "Warehouse Activity Line".</param>
    procedure InsertOrderProgress_PickCreated(var WarehouseActivityLine: Record "Warehouse Activity Line")
    var
        ProgressStatus: Enum "Order Progress CR";
        WhseActiviyLine: Record "Warehouse Activity Line";
        OrderProgressEntry: Record "Order Progress Entry CR";
    begin
        if WarehouseActivityLine.IsTemporary then
            exit;

        OrderProgressEntry.SetRange("Document No.", WarehouseActivityLine."No.");
        OrderProgressEntry.SetRange(Status, OrderProgressEntry.Status::"In Picking");
        if OrderProgressEntry.IsEmpty then begin
            if SalesHeader.get(SalesHeader."Document Type"::Order, WarehouseActivityLine."Source No.") then begin
                InsertOrderProgress(WarehouseActivityLine."No.", SalesHeader."No.", ProgressStatus::"In Picking", SalesHeader."Location Code", SalesHeader."External Document No.");
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Registered Whse. Activity Line", 'OnAfterInsertEvent', '', true, true)]

    /// <summary>
    /// InsertOrderProgress_PickRegistered.
    /// </summary>
    /// <param name="Rec">VAR Record "Registered Whse. Activity Line".</param>
    procedure InsertOrderProgress_PickRegistered(var Rec: Record "Registered Whse. Activity Line")
    var
        ProgressStatus: Enum "Order Progress CR";
        RegWhseActivityHdr: Record "Registered Whse. Activity Hdr.";
        OrderProgressEntry: Record "Order Progress Entry CR";
    begin
        if Rec.IsTemporary then
            exit;
        if RegWhseActivityHdr.get(Rec."Activity Type", rec."No.") then begin
            OrderProgressEntry.SetRange("Document No.", RegWhseActivityHdr."Whse. Activity No.");
            OrderProgressEntry.SetRange(Status, OrderProgressEntry.Status::Picked);
            if OrderProgressEntry.IsEmpty then begin
                if SalesHeader.get(SalesHeader."Document Type"::Order, Rec."Source No.") then begin
                    InsertOrderProgress(RegWhseActivityHdr."Whse. Activity No.", SalesHeader."No.", ProgressStatus::Picked, SalesHeader."Location Code", SalesHeader."External Document No.");
                end;
            end;
        end;
    end;

    /// <summary>
    /// InsertOrderProgress_Released.
    /// </summary>
    /// <param name="SalesHeader">VAR Record "Sales Header".</param>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", 'OnBeforeReleaseSalesDoc', '', true, true)]
    procedure InsertOrderProgress_Released(var SalesHeader: Record "Sales Header")
    var
        ProgressStatus: Enum "Order Progress CR";

    begin
        if SalesHeader.IsTemporary then
            exit;
        if SalesHeader."Document Type" = SalesHeader."Document Type"::Order then begin
            InsertOrderProgress(SalesHeader."No.", SalesHeader."No.", ProgressStatus::Released, SalesHeader."Location Code", SalesHeader."External Document No.");
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", 'OnAfterManualReOpenSalesDoc', '', true, true)]

    /// <summary>
    /// InsertOrderProgress_ReOpen.
    /// </summary>
    /// <param name="SalesHeader">VAR Record "Sales Header".</param>
    procedure InsertOrderProgress_ReOpen(var SalesHeader: Record "Sales Header")
    var
        ProgressStatus: Enum "Order Progress CR";
    begin
        if SalesHeader.IsTemporary then
            exit;

        if SalesHeader."Document Type" = SalesHeader."Document Type"::Order then begin
            InsertOrderProgress(SalesHeader."No.", SalesHeader."No.", ProgressStatus::"Re-Opened", SalesHeader."Location Code", SalesHeader."External Document No.");
        end;
    end;

    /// <summary>
    /// InsertOrderProgress_ShipmentCancelled.
    /// </summary>
    /// <param name="Rec">VAR Record "Warehouse Shipment Header".</param>
    [EventSubscriber(ObjectType::Table, Database::"Warehouse Shipment Header", 'OnBeforeDeleteEvent', '', true, true)]
    procedure InsertOrderProgress_ShipmentCancelled(var Rec: Record "Warehouse Shipment Header")
    var
        ProgressStatus: Enum "Order Progress CR";
        WarehouseShipmentLine: Record "Warehouse Shipment Line";
    begin
        if WarehouseShipmentLine.IsTemporary then
            exit;

        WarehouseShipmentLine.SetRange("No.", Rec."No.");
        if WarehouseShipmentLine.FindFirst() then begin
            if SalesHeader.Get(SalesHeader."Document Type"::Order, WarehouseShipmentLine."Source No.") then begin
                if SalesHeader."Document Type" = SalesHeader."Document Type"::Order then begin
                    InsertOrderProgress(rec."No.", SalesHeader."No.", ProgressStatus::"Shipment Cancelled", SalesHeader."Location Code", SalesHeader."External Document No.");
                end;
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Shipment Release", 'OnAfterReleaseWarehouseShipment', '', true, true)]

    /// <summary>
    /// InsertOrderProgress_ShipmentCreated.
    /// </summary>
    /// <param name="WarehouseShipmentHeader">VAR Record "Warehouse Shipment Header".</param>
    procedure InsertOrderProgress_ShipmentCreated(var WarehouseShipmentHeader: Record "Warehouse Shipment Header")
    var
        ProgressStatus: Enum "Order Progress CR";
        WarehouseShipmentLine: Record "Warehouse Shipment Line";
    begin
        if WarehouseShipmentHeader.IsTemporary then
            exit;

        WarehouseShipmentLine.SetRange("No.", WarehouseShipmentHeader."No.");
        if WarehouseShipmentLine.FindFirst() then begin
            if SalesHeader.get(SalesHeader."Document Type"::Order, WarehouseShipmentLine."Source No.") then begin
                InsertOrderProgress(WarehouseShipmentHeader."No.", SalesHeader."No.", ProgressStatus::"Shipment Created", SalesHeader."Location Code", SalesHeader."External Document No.");
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, database::"Sales Shipment Header", 'OnAfterInsertEvent', '', true, true)]

    /// <summary>
    /// InsertOrderProgress_ShipmentPost.
    /// </summary>
    /// <param name="Rec">VAR Record "Sales Shipment Header".</param>
    procedure InsertOrderProgress_ShipmentPost(var Rec: Record "Sales Shipment Header")
    var
        ProgressStatus: Enum "Order Progress CR";
    begin
        if SalesHeader.get(SalesHeader."Document Type"::Order, Rec."Order No.") then begin
            InsertOrderProgress(Rec."No.", SalesHeader."No.", ProgressStatus::Shipped, SalesHeader."Location Code", SalesHeader."External Document No.");
        end;
    end;

}




