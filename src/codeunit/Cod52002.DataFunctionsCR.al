/// <summary>
/// Codeunit Data Functions CR (ID 52002).
/// </summary>
codeunit 52002 "Data Functions CR"
{
    TableNo = "Job Queue Entry";

    trigger OnRun()
    begin

        if Rec."Parameter String" = 'WHSEDOCCLEAR' then begin
            PickClearDown();
        end;

        if Rec."Parameter String" = 'BINCONTENTUPD' then begin
            UpdateBinContent();
        end;

        if Rec."Parameter String" = 'CANCELREASON' then begin
            ClearCancel();
        end;

        if Rec."Parameter String" = 'CLEARAUTOPROD' then begin
            ClearAutoProd();
        end;
    end;

    local procedure ClearCancel()
    var
        salesheader: Record "Sales Header";
        salesline: Record "Sales Line";
    begin
        salesheader.SetFilter("Cancellation Reason CR", '<>%1', '');
        if salesheader.FindFirst() then begin
            salesheader.ModifyAll("Cancellation Reason CR", '', false);
        end;
        salesline.SetFilter("Cancellation Reason CR", '<>%1', '');
        if salesline.FindFirst() then begin
            salesline.ModifyAll("Cancellation Reason CR", '', false);
        end;
    end;

    local procedure PickClearDown()
    var
        WAH: Record "Warehouse Activity Header";
        WSH: Record "Warehouse Shipment Header";
        WSHRelease: Codeunit "Whse.-Shipment Release";

    begin
        //Delete Picks
        WAH.Reset();
        WAH.SetRange("Location Code", 'HAL');
        IF WAH.FindSet(true, false) then begin
            repeat
                WAH.Delete(true);
            until WAH.Next = 0;
        end;

        //Re-open Shipments
        WSH.Reset();
        wsh.SetRange("Location Code", 'HAL');
        WSH.SetRange("Document Status", wsh."Document Status"::" ");
        if wsh.FindSet() then begin
            repeat
                WSHRelease.Reopen(WSH);
            until wsh.next = 0;
        end;

        //Delete Shipments
        WSH.Reset();
        wsh.SetRange("Location Code", 'HAL');
        WSH.SetRange("Document Status", wsh."Document Status"::" ");
        WSH.SetRange(Status, WSH.Status::Open);
        if wsh.FindSet() then begin
            repeat
                WSH.Delete(true);
            until wsh.next = 0;
        end;

    end;

    local procedure UpdateBinContent()
    var
        Bin: Record Bin;
        BinContent: Record "Bin Content";
    begin

        Bin.Reset();
        Bin.SetFilter("Bin Type Code", '<>%1', '');
        if bin.FindSet(false, false) then begin
            repeat

                BinContent.Reset();
                BinContent.SetRange("Bin Code", Bin.Code);
                if BinContent.FindSet(true, false) then begin
                    repeat
                        BinContent."Bin Type Code" := bin."Bin Type Code";
                        BinContent."Bin Ranking" := Bin."Bin Ranking";
                        BinContent.Modify();
                    until BinContent.Next = 0;
                end;
            until bin.Next = 0;
        end;
    end;

    local procedure CustomerCleanse()
    var
        Customer: Record Customer;
        CustomerLedgerEntry: Record "Cust. Ledger Entry";
        SalesHeader: Record "Sales Header";
        DeleteCustomer: Boolean;
        DelNo: Integer;
    begin
        customer.setrange("Customer Price Group", 'WEB01');
        if Customer.FindSet() then begin
            repeat
                DeleteCustomer := true;
                CustomerLedgerEntry.reset;
                CustomerLedgerEntry.SetRange("Customer No.", Customer."No.");
                if CustomerLedgerEntry.FindFirst() then begin
                    DeleteCustomer := false;
                end;

                IF DeleteCustomer then begin
                    SalesHeader.Reset;
                    SalesHeader.SetRange("Sell-to Customer No.", Customer."No.");
                    if SalesHeader.FindFirst() then begin
                        DeleteCustomer := false;
                    end;
                end;

                if DeleteCustomer then begin
                    customer.Delete(true);
                end;
            until Customer.next = 0;
        end;
    end;

    local procedure ClearAutoProd()
    var
        ProdOrder: Record "Production Order";
    begin
        ProdOrder.SetRange("Auto-Generated CR",true);
        ProdOrder.SetRange("Started CR", false);
        ProdOrder.SetRange("Source Type", ProdOrder."Source Type"::Item);
        ProdOrder.SetRange("Location Code", 'HAL');
        ProdOrder.Setfilter("Creation Date", '%1', 20210625D);
        if not ProdOrder.IsEmpty then
            ProdOrder.DeleteAll(true);
    end;
}
