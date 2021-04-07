/// <summary>
/// PageExtension "WarehousePhysInvJnlCR" (ID 52013) extends Record Whse. Phys. Invt. Journal.
/// </summary>
pageextension 52013 WarehousePhysInvJnlCR extends "Whse. Phys. Invt. Journal"
{
    actions
    {
        addafter("Calculate &Inventory")
        {
            action(ResetToZeroCR)
            {
                Caption = '&Reset Qty. to Zero';
                ApplicationArea = All;
                Image = ResetStatus;

                trigger OnAction()
                begin
                    WarehouseJournalLine.Reset();
                    WarehouseJournalLine.SetRange("Journal Template Name", rec."Journal Template Name");
                    WarehouseJournalLine.SetRange("Journal Batch Name", rec."Journal Batch Name");
                    WarehouseJournalLine.SetRange("Location Code", rec."Location Code");
                    if WarehouseJournalLine.FindFirst() then begin
                        WarehouseJournalLine.ModifyAll("Qty. (Phys. Inventory)", 0, true);
                    end;
                end;
            }
        }
    }
    var
        WarehouseJournalLine: Record "Warehouse Journal Line";

}
