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
    procedure CalcAvailInv(var pItemCode: Code[20]; pLocationCode: Code[10]; pRequired: Decimal)
    /// <param name="pRequired">Decimal.</param>
    var
        AvailQty: Decimal;
        item: Record item;
        SalesLine: Record "Sales Line";
    begin
        if item.get(pItemCode) then begin
            item.SetFilter("Location Filter", pLocationCode);
            




        end;

    end;
}
