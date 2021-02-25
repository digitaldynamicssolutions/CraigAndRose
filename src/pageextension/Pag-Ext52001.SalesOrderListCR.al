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
    }
}
