/// <summary>
/// Codeunit Sales Functions CR (ID 52004).
/// </summary>
codeunit 52004 "Sales Functions CR"
{
    /// <summary>
    /// CalcAvailInv.
    /// </summary>
    /// <param name="pItemCode">VAR Code[20].</param>
    /// <param name="pLocationCode">Code[10].</param>
    /// <param name="pRequired">Decimal.</param>
    /// <returns>Return value of type Decimal.</returns>
    procedure CalcAvailInv(var pItemCode: Code[20]; pLocationCode: Code[10]; pRequired: Decimal): Decimal
    var
        AvailQty: Decimal;
        TransferInboundQty: Decimal;
        QCQty: Decimal;
        item: Record item;
        SalesLine: Record "Sales Line";
        TransferLine: Record "Transfer Line";
        BinContent: Record "Bin Content";
        BinType: Record "Bin Type";

    begin
        Clear(AvailQty); //25/06/21
        if item.get(pItemCode) then begin
            item.SetFilter("Location Filter", pLocationCode);
            item.CalcFields(Inventory, "Qty. on Sales Order", "Trans. Ord. Shipment (Qty.)", "Assembly BOM");

            If not item."Assembly BOM" then begin
                AvailQty := item.Inventory - item."Qty. on Sales Order" - item."Trans. Ord. Shipment (Qty.)";
                //Inbound Transfer

                //Non Pick Stock
                Clear(QCQty);
                BinContent.SetRange("Location Code", pLocationCode);
                BinContent.SetRange("Item No.", pItemCode);
                if BinContent.FindSet(false, false) THEN BEGIN
                    repeat
                        if BinType.GET(BinContent."Bin Type Code") then begin
                            if BinType.Pick = false then begin
                                BinContent.CALCFIELDS(Quantity);
                                QCQty += BinContent.Quantity;
                            end;
                        end;
                    until BinContent.Next = 0;
                end;
                AvailQty := AvailQty - QCQty;

            end;
            exit(AvailQty);

        end;
    end;

    /// <summary>
    /// CancelSalesOrderLine.
    /// </summary>
    /// <param name="pDocNo">VAR Code[20].</param>
    procedure CancelSalesOrderLine(var pDocNo: Code[20])
    var
        ArchiveManagement: Codeunit ArchiveManagement;
        SalesLine: Record "Sales Line";
        SalesHeader: Record "Sales Header";
        LineCount: Integer;
    begin
        SalesLine.SetRange("Document Type", SalesLine."Document Type"::Order);
        SalesLine.SetRange("Document No.", pDocNo);
        SalesLine.SetFilter("Cancellation Reason CR", '<>%1', '');
        if SalesLine.FindFirst() then begin
            LineCount := SalesLine.Count;
            if confirm('Are you sure you want to delete %1 lines?', true, LineCount) then begin
                if SalesHeader.get(SalesLine."Document Type", SalesLine."Document No.") then begin
                    ArchiveManagement.StoreSalesDocument(SalesHeader,false);
                end;
                SalesLine.DeleteAll(true);
            end;

        end;

    end;
}
