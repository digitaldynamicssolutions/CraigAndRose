/// <summary>
/// Page Order Progress Status List CR (ID 52000).
/// </summary>
page 52000 "Order Progress Status List CR"
{

    ApplicationArea = All;
    Caption = 'Order Progress Status List';
    PageType = List;
    SourceTable = "Order Progress Entry CR";
    UsageCategory = History;
    Editable = false;
    SourceTableView = SORTING("Entry No.")
                      ORDER(Descending);

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Original Order No."; Rec."Original Order No.")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                }
                field("Status DateTime"; Rec."Status DateTime")
                {
                    ApplicationArea = All;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = All;
                }

                field("Package Tracking Number"; Rec."Package Tracking Number")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}
