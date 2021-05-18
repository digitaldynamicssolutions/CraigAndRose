codeunit 52009 "CleverDynamicsExtensionsCR"
{
    var
        SessionMgt: Codeunit "Session Mgt. CHHFTMN";

    //Subscribe to OnAfterInitActivity
    //This will execute after the warehouse activity is initialised
    //Initialise a handheld DataItem called QTYOUTSTANDINGBASE
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Std. Trans. Activ Mgt. CHHWTMN", 'OnAfterInitActivity', '', false, false)]
    procedure OnAfterInitActivityQtyOutstandingBase(var Sender: Codeunit "Std. Trans. Activ Mgt. CHHWTMN")
    begin
        SessionMgt.InitResponseData('QTYOUTSTANDINGBASE', 'Qty. Outstanding (Base)', true);
    end;

    //Subscribe to OnAfterValidateActivity
    //This will execute after the warehouse activity is validated on each round-trip from the device
    //Store the activity's Qty. Outstanding (Base) in the handheld DataItem called QTYOUTSTANDINGBASE
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Std. Trans. Activ Mgt. CHHWTMN", 'OnAfterValidateActivity', '', false, false)]
    procedure OnAfterValidateActivityQtyOutstandingBase(var Sender: Codeunit "Std. Trans. Activ Mgt. CHHWTMN")
    var
        WarehouseActivityLine: Record "Warehouse Activity Line";
        ActivityNo: Code[20];
        ActivityLineNo: Integer;
    begin
        ActivityNo := SessionMgt.GetContent('ACTIVITYNO');
        Evaluate(ActivityLineNo, SessionMgt.GetContent('ACTIVITYLINENO'));
        if WarehouseActivityLine.Get(WarehouseActivityLine."Activity Type"::Pick, ActivityNo, ActivityLineNo) then
            SessionMgt.SetTransResponseData('QTYOUTSTANDINGBASE', Format(WarehouseActivityLine."Qty. Outstanding (Base)"), true)
        //SessionMgt.SetTransResponseData('QTYOUTSTANDINGBASE', '99', true)
        else
            SessionMgt.SetTransResponseData('QTYOUTSTANDINGBASE', '', true);
    end;

}