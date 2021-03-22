/// <summary>
/// PageExtension "SalesOrderPageCR" (ID 52003) extends Record Sales Order.
/// </summary>
pageextension 52003 SalesOrderPageCR extends "Sales Order"
{
    layout
    {
        addafter(Status)
        {
            field("Progress Status CR"; Rec."Progress Status CR")
            {
                ApplicationArea = All;
                ToolTip = 'This displays the current shipping progress of this order';
                StyleExpr = 'Strong';
            }

            field("Progress Status DateTime CR"; Rec."Progress Status DateTime CR")
            {
                ApplicationArea = All;
                StyleExpr = 'Strong';
            }

            field("CS On Hold CR"; Rec."CS On Hold CR")
            {
                ApplicationArea = All;
                ToolTip = 'Set this to mark the order as "On Hold", this will prevent any automatic processing or document creation';
                trigger OnValidate()
                begin
                    CurrPage.Update();
                end;
            }

            field("CS To Cancel CR"; Rec."CS To Cancel CR")
            {
                ApplicationArea = All;
                ToolTip = 'Set this to mark the order as "To Cancel", this will prevent any automatic processing or document creation';
                trigger OnValidate()
                begin
                    CurrPage.Update();
                end;
            }
        }

    }

    actions
    {
        addafter(Invoices)
        {
            action(OrderProgressEntriesCR)
            {
                Caption = '&Order Progress Entries';
                ApplicationArea = All;
                Image = EntriesList;
                Promoted = true;
                PromotedCategory = Category12;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    OrderProgressEntries: Record "Order Progress Entry CR";
                    OrderProgressEntriesList: Page "Order Progress Status List CR";
                begin
                    OrderProgressEntries.SetRange("Original Order No.", rec."No.");
                    OrderProgressEntriesList.SetTableView(OrderProgressEntries);
                    OrderProgressEntriesList.Run();
                end;
            }
        }

        addafter(Invoices)
        {
            action(OpenShipmentCR)
            {
                Caption = '&Open Shipment';
                ApplicationArea = All;
                Image = Shipment;
                Promoted = true;
                PromotedCategory = Category12;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    WarehouseShipmentLine: Record "Warehouse Shipment Line";
                    WarehouseShipmentHeader: Record "Warehouse Shipment Header";
                    WarehouseShipmentPage: Page "Warehouse Shipment";
                    ShipmentNotification: Notification;
                begin
                    WarehouseShipmentLine.SetRange("Source Document", WarehouseShipmentLine."Source Document"::"Sales Order");
                    WarehouseShipmentLine.SetRange("Source No.", Rec."No.");
                    IF WarehouseShipmentLine.FindFirst() then begin
                        IF WarehouseShipmentHeader.GET(WarehouseShipmentLine."No.") then begin
                            WarehouseShipmentPage.SetRecord(WarehouseShipmentHeader);
                            WarehouseShipmentPage.Run();
                        end;
                    end else begin
                        ShipmentNotification.Message('No Warehouse Shipment exists.');
                        ShipmentNotification.Scope := NotificationScope::LocalScope;
                        ShipmentNotification.Send();
                    end;
                end;
            }
            action(OpenPickCR)
            {
                Caption = '&Open Pick';
                ApplicationArea = All;
                Image = PickLines;
                Promoted = true;
                PromotedCategory = Category12;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    WarehouseActivityLine: Record "Warehouse Activity Line";
                    WarehouseActivityHeader: Record "Warehouse Activity Header";
                    WarehousePickPage: Page "Warehouse Pick";
                    PickNotification: Notification;
                begin
                    WarehouseActivityLine.SetRange("Activity Type", WarehouseActivityLine."Activity Type"::Pick);
                    WarehouseActivityLine.SetRange("Source No.", Rec."No.");
                    IF WarehouseActivityLine.FindFirst() then begin
                        IF WarehouseActivityHeader.GET(WarehouseActivityLine."Activity Type", WarehouseActivityLine."No.") then begin
                            WarehousePickPage.SetRecord(WarehouseActivityHeader);
                            WarehousePickPage.Run();
                        end;
                    end else begin
                        PickNotification.Message('No Warehouse Pick exists.');
                        PickNotification.Scope := NotificationScope::LocalScope;
                        PickNotification.Send();
                    end;
                end;
            }

        }
    }

}
