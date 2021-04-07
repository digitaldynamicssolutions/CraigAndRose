/// <summary>
/// PageExtension PhysInventoryJournalCR (ID 52012) extends Record Phys. Inventory Journal.
/// </summary>
pageextension 52012 "PhysInventoryJournalCR" extends "Phys. Inventory Journal"
{
    actions
    {
        addafter(CalculateCountingPeriod)
        {
            action(ResetToZeroCR)
            {
                Caption = '&Reset Qty. to Zero';
                ApplicationArea = All;
                Image = ResetStatus;

                trigger OnAction()
                begin
                    ItemJournalLine.Reset();
                    ItemJournalLine.SetRange("Journal Template Name", rec."Journal Template Name");
                    ItemJournalLine.SetRange("Journal Batch Name", rec."Journal Batch Name");
                    ItemJournalLine.SetRange("Location Code", rec."Location Code");
                    if ItemJournalLine.FindFirst() then begin
                        ItemJournalLine.ModifyAll("Qty. (Phys. Inventory)",0 ,true);
                    end;
                end;
            }
        }
    }
    var
        ItemJournalLine: Record "Item Journal Line";

}
