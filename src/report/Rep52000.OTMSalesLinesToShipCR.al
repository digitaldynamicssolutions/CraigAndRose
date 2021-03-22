/// <summary>
/// Report OTM Sales Lines To Ship (ID 52000).
/// </summary>
report 52000 "OTM Sales Lines To Ship CR"
{
    DefaultLayout = RDLC;
    RDLCLayout = './OTMSalesLine.rdlc';
    ApplicationArea = Basic, Suite;
    Caption = 'OTM Sales Lines To Ship';
    UsageCategory = ReportsAndAnalysis;
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem(SalesLine; "Sales Line")
        {
            column(DocumentType; "Document Type")
            {
            }
            column(DocumentNo; "Document No.")
            {
            }
            column(LineNo; "Line No.")
            {
            }
            column(No_; "No.")
            {
            }
            column(Description; Description)
            {
            }
            column(Quantity; Quantity)
            {
            }
            column(ShipName; ShipName)
            {
            }
            column(ShipAddr; ShipAddr)
            {
            }
            column(ShipAddr2; ShipAddr2)
            {
            }
            column(ShipCity; ShipCity)
            {
            }
            column(ShipPostcode; ShipPostcode)
            {

            }
            column(ShipOrderDate; ShipOrderDate)
            {

            }
            trigger OnPreDataItem()
            begin
                SalesLine.SetRange("Document Type", SalesLine."Document Type"::Order);
                SalesLine.SetRange("Location Code", 'OTM');
                SalesLine.SetRange("Sent to OTM", false);
                SalesLine.SetFilter("Item Category Code", ItemCategoryFilter);
            end;

            trigger OnAfterGetRecord()
            begin
                if SalesHeader.get(SalesLine."Document Type", SalesLine."Document No.") then begin
                    if SalesHeader.Status <> SalesHeader.Status::Released then
                        CurrReport.Skip();

                    ShipName := SalesHeader."Ship-to Name";
                    ShipAddr := SalesHeader."Ship-to Address";
                    ShipAddr2 := SalesHeader."Ship-to Address 2";
                    ShipCity := SalesHeader."Ship-to City";
                    ShipPostcode := SalesHeader."Ship-to Post Code";
                    ShipOrderDate := SalesHeader."Order Date";

                end;
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }

    var
        SalesHeader: Record "Sales Header";
        ShipName: Text[50];
        ShipAddr: Text[100];
        ShipAddr2: Text[50];
        ShipCity: Text[30];
        ShipPostcode: Code[20];
        ShipOrderDate: Date;
        ItemCategoryFilter: Code[20];


    /// <summary>
    /// SetItemCatFilter.
    /// </summary>
    /// <param name="pItemCatFilter">Code[20].</param>
    procedure SetItemCatFilter(pItemCatFilter: Code[20])
    begin
        ItemCategoryFilter := pItemCatFilter;
    end;

}
