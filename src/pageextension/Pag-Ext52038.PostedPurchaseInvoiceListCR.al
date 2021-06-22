pageextension 52038 "PostedPurchaseInvoiceListCR" extends "Posted Purchase Invoices"
{
    layout
    {
        addafter("No. Printed")
        {
            field("No. of Comments CR"; rec."No. of Comments CR")
            {
                ApplicationArea = All;
            }
        }
    }
}
