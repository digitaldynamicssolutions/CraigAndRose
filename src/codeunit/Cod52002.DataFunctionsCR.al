codeunit 52002 "Data Functions CR"
{
    TableNo = "Job Queue Entry";

    trigger OnRun()
    begin

        if Rec."Parameter String" = 'PICKCLEAR' then begin
            PickClearDown();
        end;

    end;

    local procedure PickClearDown()
    var
        WAH: Record "Warehouse Activity Header";
    begin
        WAH.Reset();
        WAH.SetRange(Type, WAH.Type::Pick);
        WAH.SetRange("Location Code", 'HAL');
        IF WAH.FindSet(true, false) then begin
            repeat
                WAH.Delete(true);
            until WAH.Next = 0;
        end;

    end;
    
}
