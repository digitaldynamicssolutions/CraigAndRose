/// <summary>
/// PageExtension PostedSalesInvoicetListCR (ID 52005) extends Record Posted Sales Invoices.
/// </summary>
pageextension 52005 "PostedSalesInvoicetListCR" extends "Posted Sales Invoices"
{
    layout
    {
        addafter("No. Printed")
        {
            field("No. of Comments CR"; rec."No. of Comments CR")
            {
                ApplicationArea = All;
            }
        }

        addafter(Closed)
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
        addafter(Navigate)
        {
            action(OrderProgressEntriesCR)
            {
                Caption = '&Order Progress Entries';
                ApplicationArea = All;
                Image = EntriesList;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    OrderProgressEntries: Record "Order Progress Entry CR";
                    OrderProgressEntriesList: Page "Order Progress Status List CR";
                begin
                    OrderProgressEntries.SetRange("Original Order No.", rec."Order No.");
                    OrderProgressEntriesList.SetTableView(OrderProgressEntries);
                    OrderProgressEntriesList.Run();
                end;
            }
        }
    }
}