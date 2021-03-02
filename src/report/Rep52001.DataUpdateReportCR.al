/// <summary>
/// Report OTM Sales Lines To Ship (ID 52000).
/// </summary>
report 52001 "Data Update Report CR"
{
    DefaultLayout = RDLC;
    RDLCLayout = './ReopenSO.rdlc';
    ApplicationArea = Basic, Suite;
    Caption = 'DataUpdateCR';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;

    dataset
    {
        dataitem(SalesHeader; "Sales Header")
        {
            column(DocumentType; "Document Type")
            {
            }
            column(No; "No.")
            {
            }
            column(Status; Status)
            {

            }
            column(Location_Code; "Location Code")
            {

            }
            trigger OnPreDataItem()
            begin
                SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
                SalesHeader.SetRange(Status, SalesHeader.Status::Released);
                SalesHeader.SetRange("Location Code", 'HAL');
            end;

            trigger OnAfterGetRecord()
            var
                WSL: Record "Warehouse Shipment Line";
                PWSL: Record "Posted Whse. Shipment Line";
                SalesRelease: Codeunit "Release Sales Document";
            begin


                WSL.Reset;
                WSL.SetRange("Source Document", WSL."Source Document"::"Sales Order");
                WSL.SetRange("Source No.", SalesHeader."No.");
                WSL.SetRange("Location Code", 'HAL');
                IF not WSL.FindFirst() then begin
                    PWSL.Reset;
                    PWSL.SetRange("Source Document", WSL."Source Document"::"Sales Order");
                    PWSL.SetRange("Source No.", SalesHeader."No.");
                    PWSL.SetRange("Location Code", 'HAL');
                    IF not PWSL.FindFirst() then begin
                        SalesRelease.Reopen(SalesHeader);
                        C := c + 1;
                    end;
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

        c: Integer;

    trigger OnPostReport()
    begin
        message(format(c));

    end;
}