/// <summary>
/// TableExtension SalesInvoiceHeaderCR (ID 52008) extends Record Sales Invoice Header.
/// </summary>
tableextension 52008 "SalesInvoiceHeaderCR" extends "Sales Invoice Header"
{
    fields
    {
        field(52000; "Sent to OTM"; Boolean)
        {
            Caption = 'Sent to OTM';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(52001; "Sent to OTM DateTime"; DateTime)
        {
            Caption = 'Sent to OTM DateTime';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(52002; "Progress Status CR"; enum "Order Progress CR")
        {
            Caption = 'Progress Status';
            Editable = false;
            Enabled = false;
        }
        field(52003; "Last Progress Entry No. CR"; Integer)
        {
            Caption = 'Last Progress Entry No.';
            Editable = false;
            Enabled = false;
        }
        field(52004; "Progress Status DateTime CR"; DateTime)
        {
            Caption = 'Progress Status DateTime';
            Editable = false;
            Enabled = false;
        }
        field(52005; "CS On Hold CR"; Boolean)
        {
            Caption = 'CS On Hold';
            DataClassification = ToBeClassified;
            Enabled = false;
        }
        field(52006; "CS To Cancel CR"; Boolean)
        {
            Caption = 'CS To Cancel';
            DataClassification = ToBeClassified;
            Enabled = false;
        }
        field(52007; "Cancellation Reason CR"; Code[20])
        {
            Caption = 'Cancellation Reason';
            DataClassification = ToBeClassified;
            TableRelation = "Field Lookup CR".Code where("Lookup Code" = const('CANCELSALES'));
            Editable = false;
        }
    }
}
