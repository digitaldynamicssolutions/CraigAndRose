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

        addafter("Order Progress CR")
        {
            field("Progress Status DateTime CR"; Rec."Progress Status DateTime CR")
            {
                ApplicationArea = All;
                StyleExpr = 'Strong';
            }
        }

        addafter("Location Code")
        {
            field("No. of Comments CR"; Rec."No. of Comments CR")
            {
                ApplicationArea = All;
            }
        }
        
        addafter("Amount Including VAT")
        {

            field(TRCUDF1; Rec.TRCUDF1)
            {
                ToolTip = 'Specifies the value of the TRCUDF1 field';
                ApplicationArea = All;
            }
            field(TRCUDF2; Rec.TRCUDF2)
            {
                ToolTip = 'Specifies the value of the TRCUDF2 field';
                ApplicationArea = All;
            }
            field(TRCUDF3; Rec.TRCUDF3)
            {
                ToolTip = 'Specifies the value of the TRCUDF3 field';
                ApplicationArea = All;
            }
            field(TRCUDF4; Rec.TRCUDF4)
            {
                ToolTip = 'Specifies the value of the TRCUDF4 field';
                ApplicationArea = All;
            }
            field(TRCUDF5; Rec.TRCUDF5)
            {
                ToolTip = 'Specifies the value of the TRCUDF5 field';
                ApplicationArea = All;
            }
            field(TRCPONumbers; Rec.TRCPONumbers)
            {
                ToolTip = 'Specifies the value of the TRCPONumbers field';
                ApplicationArea = All;
            }
            field(TRCCarrierPro; Rec.TRCCarrierPro)
            {
                ToolTip = 'Specifies the value of the TRCCarrierPro field';
                ApplicationArea = All;
            }
            field(TRCShipToType; Rec.TRCShipToType)
            {
                ToolTip = 'Specifies the value of the TRCShipToType field';
                ApplicationArea = All;
            }
            field(TRCBillofLading; Rec.TRCBillofLading)
            {
                ToolTip = 'Specifies the value of the TRCBillofLading field';
                ApplicationArea = All;
            }
            field(TRCLocationCodes; Rec.TRCLocationCodes)
            {
                ToolTip = 'Specifies the value of the TRCLocationCodes field';
                ApplicationArea = All;
            }
            field(TRCTrailerNumber; Rec.TRCTrailerNumber)
            {
                ToolTip = 'Specifies the value of the TRCTrailerNumber field';
                ApplicationArea = All;
            }
            field(TRCPriceException; Rec.TRCPriceException)
            {
                ToolTip = 'Specifies the value of the TRCPriceException field';
                ApplicationArea = All;
            }
            field(TRCDepartmentNumber; Rec.TRCDepartmentNumber)
            {
                ToolTip = 'Specifies the value of the TRCDepartmentNumber field';
                ApplicationArea = All;
            }
            field(TRCDistributionCenterCode; Rec.TRCDistributionCenterCode)
            {
                ToolTip = 'Specifies the value of the TRCDistributionCenterCode field';
                ApplicationArea = All;
            }
            field(TRCASNType; Rec.TRCASNType)
            {
                ToolTip = 'Specifies the value of the TRCASNType field';
                ApplicationArea = All;
            }
            field(TRC3PL; Rec.TRC3PL)
            {
                ToolTip = 'Specifies the value of the TRC3PL field';
                ApplicationArea = All;
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
