/// <summary>
/// Codeunit "ReOpenSalesDocExtCR" (ID 52005).
/// </summary>
codeunit 52005 ReOpenSalesDocExtCR
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", 'OnBeforeReopenSalesDoc', '', true, true)]

    /// <summary>
    /// CheckHeaderFields.
    /// </summary>
    /// <param name="SalesHeader">VAR Record "Sales Header".</param>
    procedure CheckHeaderFields(var SalesHeader: Record "Sales Header")
    begin
        SalesHeader.TestField("CS On Hold CR", false);
        SalesHeader.TestField("CS To Cancel CR", false);
    end; 
}