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
                PromotedCategory = Category5;
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
    }
}