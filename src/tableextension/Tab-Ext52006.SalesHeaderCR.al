/// <summary>
/// TableExtension SalesHeaderCR (ID 52006) extends Record Sales Header.
/// </summary>
tableextension 52006 "SalesHeaderCR" extends "Sales Header"
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
            FieldClass = FlowField;
            CalcFormula = max("Order Progress Entry CR".Status WHERE("Entry No." = field("Last Progress Entry No. CR")));
        }
        field(52003; "Last Progress Entry No. CR"; Integer)
        {
            Caption = 'Last Progress Entry No.';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = max("Order Progress Entry CR"."Entry No." WHERE("Original Order No." = FIELD("No.")));
        }
        field(52004; "Progress Status DateTime CR"; DateTime)
        {
            Caption = 'Progress Status DateTime';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = max("Order Progress Entry CR"."Status DateTime" WHERE("Entry No." = field("Last Progress Entry No. CR")));
        }
        field(52005; "CS On Hold CR"; Boolean)
        {
            Caption = 'CS On Hold';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                OrderProgressSub: Codeunit "Order Progress Sub. CR";
                ProgressStatus: Enum "Order Progress CR";
            begin
                if "CS On Hold CR" then begin
                    TestField(Status, Status::Open);
                    OrderProgressSub.InsertOrderProgress("No.", "No.", ProgressStatus::"On Hold", "Location Code", "External Document No.", '');
                end;
            end;
        }
        field(52006; "CS To Cancel CR"; Boolean)
        {
            Caption = 'CS To Cancel';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                OrderProgressSub: Codeunit "Order Progress Sub. CR";
                ProgressStatus: Enum "Order Progress CR";
                WarehouseShipmentLine: Record "Warehouse Shipment Line";
                WarehouseActivityLine: Record "Warehouse Activity Line";
            begin
                if "CS To Cancel CR" then begin
                    
                    WarehouseActivityLine.SetRange("Activity Type", WarehouseActivityLine."Activity Type"::Pick);
                    WarehouseActivityLine.SetRange("Source Document", WarehouseActivityLine."Source Document"::"Sales Order");
                    WarehouseActivityLine.SetRange("Source No.", "No.");
                    if WarehouseActivityLine.FindFirst() then
                        error('You must delete or process any outstanding warehouse picks to cancel an order');

                    WarehouseShipmentLine.SetRange("Source Document", WarehouseShipmentLine."Source Document"::"Sales Order");
                    WarehouseShipmentLine.SetRange("Source No.", "No.");
                    if WarehouseShipmentLine.FindFirst() then
                        error('You must delete or process any outstanding warehouse shipments to cancel an order');

                    TestField(Status, Status::Open);
                    OrderProgressSub.InsertOrderProgress("No.", "No.", ProgressStatus::"To Cancel", "Location Code", "External Document No.", '');
                end;
            end;
        }
        field(52007; "Cancellation Reason CR"; Code[20])
        {
            Caption = 'Cancellation Reason';
            DataClassification = ToBeClassified;
            TableRelation = "Field Lookup CR".Code where("Lookup Code" = const('CANCELSALES'));

            trigger OnValidate()
            var
                SalesLine: Record "Sales Line";
                FieldLookup: Record "Field Lookup CR";
            begin
                SalesLine.SetRange("Document Type", "Document Type"::Order);
                salesline.SetRange("Document No.", "No.");
                if SalesLine.FindFirst() then begin
                    SalesLine.ModifyAll("Cancellation Reason CR", "Cancellation Reason CR", false);
                end;

                if FieldLookup.Get('CANCELSALES', "Cancellation Reason CR") then begin
                    if FieldLookup."Sales Refund Confirmation" then begin
                        Message('Ensure any refund on this order has been completed');
                    end;
                end;

            end;
        }
        field(52008; "No. of Comments CR"; Integer)
        {
            Caption = 'No. of Comments';
            FieldClass = FlowField;
            CalcFormula = count("Sales Comment Line" where("Document Type" = field("Document Type"), "No." = field("No.")));
            Editable = false;
        }
    }
}
