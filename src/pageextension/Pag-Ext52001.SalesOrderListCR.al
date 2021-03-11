/// <summary>
/// PageExtension SalesOrderListCR (ID 52001) extends Record Sales Order List.
/// </summary>
pageextension 52001 "SalesOrderListCR" extends "Sales Order List"
{
    layout
    {
        addafter(Status)
        {
            field("Sent to OTM"; Rec."Sent to OTM")
            {
                ApplicationArea = All;
            }
        }

        addafter("Sent to OTM")
        {
            field("Sent to OTM DateTime"; Rec."Sent to OTM DateTime")
            {
                ApplicationArea = All;
            }
        }

        addafter("Assigned User ID")
        {
            field("Order Date"; Rec."Order Date")
            {
                ApplicationArea = All;
            }
        }

        modify("Document Date")
        {
            Visible = false;
        }

        addafter(Status)
        {
            field("Order Progress CR"; Rec."Progress Status CR")
            {
                ApplicationArea = All;
                StyleExpr = 'Strong';
            }
        }

    }
    actions
    {
        addbefore(Dimensions)
        {
            action(OrderProgressEntriesCR)
            {
                Caption = '&Order Progress Entries';
                ApplicationArea = All;
                Image = EntriesList;
                Promoted = true;
                PromotedCategory = Category9;
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
        
            action(OpenShipmentCR)
            {
                Caption = '&Open Shipment';
                ApplicationArea = All;
                Image = Shipment;
                Promoted = true;
                PromotedCategory = Category9;
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
                PromotedCategory = Category9;
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
