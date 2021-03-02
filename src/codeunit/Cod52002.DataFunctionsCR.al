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

}
