pageextension 52035 "PurchInvoiceListPageCr" extends "Purchase Invoices"
{
    layout
    {
        addafter(Status)
        {
            field("No. of Comments CR"; rec."No. of Comments CR")
            {
                ApplicationArea = All;
            }
        }
    }
}