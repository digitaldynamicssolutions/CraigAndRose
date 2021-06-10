report 52005 "Homebase Sales Shipment CR"
{
    RDLCLayout = './HomebaseSalesShipmentCR.rdlc';
    WordLayout = './HomebaseSalesShipmentCR.docx';
    Caption = 'Homebase Sales - Shipment CR';
    DefaultLayout = Word;
    EnableHyperlinks = true;
    PreviewMode = PrintLayout;
    WordMergeDataItem = Header;

    dataset
    {
        dataitem(Header; "Sales Shipment Header")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
            RequestFilterHeading = 'Posted Sales Shipment';
            column(CompanyAddress1; CompanyAddr[1])
            {
            }
            column(CompanyAddress2; CompanyAddr[2])
            {
            }
            column(CompanyAddress3; CompanyAddr[3])
            {
            }
            column(CompanyAddress4; CompanyAddr[4])
            {
            }
            column(CompanyAddress5; CompanyAddr[5])
            {
            }
            column(CompanyAddress6; CompanyAddr[6])
            {
            }
            column(CompanyAddress7; CompanyAddr[7])
            {
            }
            column(CompanyAddress8; CompanyAddr[8])
            {
            }
            column(CompanyHomePage; CompanyInfo."Home Page")
            {
            }
            column(CompanyEMail; CompanyInfo."E-Mail")
            {
            }
            column(CompanyPicture; DummyCompanyInfo.Picture)
            {
            }
            column(CompanyPhoneNo; CompanyInfo."Phone No.")
            {
            }
            column(CompanyPhoneNo_Lbl; CompanyInfoPhoneNoLbl)
            {
            }
            column(CompanyGiroNo; CompanyInfo."Giro No.")
            {
            }
            column(CompanyGiroNo_Lbl; CompanyInfoGiroNoLbl)
            {
            }
            column(CompanyBankName; CompanyInfo."Bank Name")
            {
            }
            column(CompanyBankName_Lbl; CompanyInfoBankNameLbl)
            {
            }
            column(CompanyBankBranchNo; CompanyInfo."Bank Branch No.")
            {
            }
            column(CompanyBankBranchNo_Lbl; CompanyInfo.FieldCaption("Bank Branch No."))
            {
            }
            column(CompanyBankAccountNo; CompanyInfo."Bank Account No.")
            {
            }
            column(CompanyBankAccountNo_Lbl; CompanyInfoBankAccNoLbl)
            {
            }
            column(CompanyIBAN; CompanyInfo.IBAN)
            {
            }
            column(CompanyIBAN_Lbl; CompanyInfo.FieldCaption(IBAN))
            {
            }
            column(CompanySWIFT; CompanyInfo."SWIFT Code")
            {
            }
            column(CompanySWIFT_Lbl; CompanyInfo.FieldCaption("SWIFT Code"))
            {
            }
            column(CompanyLogoPosition; CompanyLogoPosition)
            {
            }
            column(CompanyRegistrationNumber; CompanyInfo.GetRegistrationNumber())
            {
            }
            column(CompanyRegistrationNumber_Lbl; CompanyInfo.GetRegistrationNumberLbl())
            {
            }
            column(CompanyVATRegNo; CompanyInfo.GetVATRegistrationNumber())
            {
            }
            column(CompanyVATRegNo_Lbl; CompanyInfo.GetVATRegistrationNumberLbl())
            {
            }
            column(CompanyVATRegistrationNo; CompanyInfo.GetVATRegistrationNumber())
            {
            }
            column(CompanyVATRegistrationNo_Lbl; CompanyInfo.GetVATRegistrationNumberLbl())
            {
            }
            column(CompanyLegalOffice; CompanyInfo.GetLegalOffice())
            {
            }
            column(CompanyLegalOffice_Lbl; CompanyInfo.GetLegalOfficeLbl())
            {
            }
            column(CompanyCustomGiro; CompanyInfo.GetCustomGiro())
            {
            }
            column(CompanyCustomGiro_Lbl; CompanyInfo.GetCustomGiroLbl())
            {
            }
            column(CompanyLegalStatement; GetLegalStatement())
            {
            }
            column(BilltoAddressCaption; BilltoAddressCaptionLbl)
            {
            }
            column(CustomerAddress1; CustAddr[1])
            {
            }
            column(CustomerAddress2; CustAddr[2])
            {
            }
            column(CustomerAddress3; CustAddr[3])
            {
            }
            column(CustomerAddress4; CustAddr[4])
            {
            }
            column(CustomerAddress5; CustAddr[5])
            {
            }
            column(CustomerAddress6; CustAddr[6])
            {
            }
            column(CustomerAddress7; CustAddr[7])
            {
            }
            column(CustomerAddress8; CustAddr[8])
            {
            }
            column(CustomerPostalBarCode; FormatAddr.PostalBarCode(1))
            {
            }
            column(YourReference; "Your Reference")
            {
            }
            column(YourReference_Lbl; FieldCaption("Your Reference"))
            {
            }
            column(ShipmentMethodDescription; ShipmentMethod.Description)
            {
            }
            column(ShipmentMethodDescription_Lbl; ShptMethodDescLbl)
            {
            }
            column(ShipmentDate; Format("Shipment Date", 0, 4))
            {
            }
            column(ShipmentDate_Lbl; FieldCaption("Shipment Date"))
            {
            }
            column(Shipment_Lbl; ShipmentLbl)
            {
            }
            column(ShowCustAddress; ShowCustAddr)
            {
            }
            column(ShipToAddress_Lbl; ShiptoAddrLbl)
            {
            }
            column(ShipToAddress1; ShipToAddr[1])
            {
            }
            column(ShipToAddress2; ShipToAddr[2])
            {
            }
            column(ShipToAddress3; ShipToAddr[3])
            {
            }
            column(ShipToAddress4; ShipToAddr[4])
            {
            }
            column(ShipToAddress5; ShipToAddr[5])
            {
            }
            column(ShipToAddress6; ShipToAddr[6])
            {
            }
            column(ShipToAddress7; ShipToAddr[7])
            {
            }
            column(ShipToAddress8; ShipToAddr[8])
            {
            }
            column(SellToContactPhoneNoLbl; SellToContactPhoneNoLbl)
            {
            }
            column(SellToContactMobilePhoneNoLbl; SellToContactMobilePhoneNoLbl)
            {
            }
            column(SellToContactEmailLbl; SellToContactEmailLbl)
            {
            }
            column(BillToContactPhoneNoLbl; BillToContactPhoneNoLbl)
            {
            }
            column(BillToContactMobilePhoneNoLbl; BillToContactMobilePhoneNoLbl)
            {
            }
            column(BillToContactEmailLbl; BillToContactEmailLbl)
            {
            }
            column(SellToContactPhoneNo; SellToContact."Phone No.")
            {
            }
            column(SellToContactMobilePhoneNo; SellToContact."Mobile Phone No.")
            {
            }
            column(SellToContactEmail; SellToContact."E-Mail")
            {
            }
            column(BillToContactPhoneNo; BillToContact."Phone No.")
            {
            }
            column(BillToContactMobilePhoneNo; BillToContact."Mobile Phone No.")
            {
            }
            column(BillToContactEmail; BillToContact."E-Mail")
            {
            }
            column(BilltoCustumerNo; "Bill-to Customer No.")
            {
            }
            column(BilltoCustomerNo_Lbl; FieldCaption("Bill-to Customer No."))
            {
            }
            column(DocumentDate; Format("Document Date", 0, 4))
            {
            }
            column(DocumentDate_Lbl; FieldCaption("Document Date"))
            {
            }
            column(DueDate; Format("Due Date", 0, 4))
            {
            }
            column(DueDate_Lbl; FieldCaption("Due Date"))
            {
            }
            column(DocumentNo; "No.")
            {
            }
            column(DocumentNo_Lbl; ShipmentNoLbl)
            {
            }
            column(OrderNo; "Order No.")
            {
            }
            column(OrderNo_Lbl; FieldCaption("Order No."))
            {
            }
            column(PricesIncludingVAT; "Prices Including VAT")
            {
            }
            column(PricesIncludingVAT_Lbl; FieldCaption("Prices Including VAT"))
            {
            }
            column(PricesIncludingVATYesNo; Format("Prices Including VAT"))
            {
            }
            column(SalesPerson_Lbl; SalespersonLbl)
            {
            }
            column(SalesPersonBlank_Lbl; SalesPersonText)
            {
            }
            column(SalesPersonName; SalespersonPurchaser.Name)
            {
            }
            column(SelltoCustomerNo; "Sell-to Customer No.")
            {
            }
            column(SelltoCustomerNo_Lbl; FieldCaption("Sell-to Customer No."))
            {
            }
            column(VATRegistrationNo; GetCustomerVATRegistrationNumber())
            {
            }
            column(VATRegistrationNo_Lbl; GetCustomerVATRegistrationNumberLbl())
            {
            }
            column(GlobalLocationNumber; GetCustomerGlobalLocationNumber())
            {
            }
            column(GlobalLocationNumber_Lbl; GetCustomerGlobalLocationNumberLbl())
            {
            }
            column(SellToPhoneNo; "Sell-to Phone No.")
            {
            }
            column(From_Lbl; FromLbl)
            {
            }
            column(BilledTo_Lbl; BilledToLbl)
            {
            }
            column(LegalEntityType; Cust.GetLegalEntityType())
            {
            }
            column(LegalEntityType_Lbl; Cust.GetLegalEntityTypeLbl())
            {
            }
            column(Copy_Lbl; CopyLbl)
            {
            }
            column(EMail_Header_Lbl; EMailLbl)
            {
            }
            column(HomePage_Header_Lbl; HomePageLbl)
            {
            }
            column(Page_Lbl; PageLbl)
            {
            }
            column(Questions_Lbl; QuestionsLbl)
            {
            }
            column(Contact_Lbl; CompanyInfo.GetContactUsText())
            {
            }
            column(DocumentTitle_Lbl; DocumentCaption())
            {
            }
            column(YourDocumentTitle_Lbl; YourSalesShipmentLbl)
            {
            }
            column(Thanks_Lbl; ThanksLbl)
            {
            }
            column(ShowWorkDescription; ShowWorkDescription)
            {
            }
            column(Subtotal_Lbl; SubtotalLbl)
            {
            }
            column(Total_Lbl; TotalLbl)
            {
            }
            column(PackageTrackingNo; "Package Tracking No.")
            {
            }
            column(PackageTrackingNo_Lbl; FieldCaption("Package Tracking No."))
            {
            }
            column(ShippingAgentCode; "Shipping Agent Code")
            {
            }
            column(ShippingAgentCode_Lbl; FieldCaption("Shipping Agent Code"))
            {
            }
            column(ExternalDocumentNo; "External Document No.")
            {
            }
            column(ExternalDocumentNo_Lbl; FieldCaption("External Document No."))
            {
            }

            dataitem(Line; "Sales Shipment Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemLinkReference = Header;
                DataItemTableView = SORTING("Document No.", "Line No.");
                column(LineNo_Line; "Line No.")
                {
                }
                column(Description_Line; Description)
                {
                }
                column(Description_Line_Lbl; FieldCaption(Description))
                {
                }
                column(ItemNo_Line; "No.")
                {
                }
                column(ItemNo_Line_Lbl; FieldCaption("No."))
                {
                }
                column(ItemReferenceNo_Line; "Item Reference No.")
                {
                }
                column(ItemReferenceNo_Line_Lbl; FieldCaption("Item Reference No."))
                {
                }
                column(ShipmentDate_Line; Format("Shipment Date"))
                {
                }
                column(ShipmentDate_Line_Lbl; PostedShipmentDateLbl)
                {
                }
                column(Quantity_Line; FormattedQuantity)
                {
                }
                column(Quantity_Line_Lbl; FieldCaption(Quantity))
                {
                }
                column(Type_Line; Format(Type))
                {
                }
                column(UnitOfMeasure; "Unit of Measure")
                {
                }
                column(UnitOfMeasure_Lbl; FieldCaption("Unit of Measure"))
                {
                }
                column(JobTaskNo_Lbl; JobTaskNoLabel)
                {
                }
                column(JobTaskNo; JobTaskNo)
                {
                }
                column(JobTaskDescription; JobTaskDescription)
                {
                }
                column(JobTaskDesc_Lbl; JobTaskDescLbl)
                {
                }
                column(JobNo_Lbl; JobNoLabel)
                {
                }
                column(JobNo; JobNo)
                {
                }
                column(Unit_Lbl; UnitLbl)
                {
                }
                column(Qty_Lbl; QtyLbl)
                {
                }
                column(ConsumerUOM; ConsumerUOMCode)
                {
                }
                column(CustomerItemRef; CustomerItemRef)
                {
                }
                column(Quantity__Base_; "Quantity (Base)")
                {
                }
                column(GTIN; GTIN)
                {
                }

                dataitem(AssemblyLine; "Posted Assembly Line")
                {
                    DataItemTableView = SORTING("Document No.", "Line No.");
                    UseTemporary = true;
                    column(LineNo_AssemblyLine; "No.")
                    {
                    }
                    column(Description_AssemblyLine; Description)
                    {
                    }
                    column(Quantity_AssemblyLine; Quantity)
                    {
                        DecimalPlaces = 0 : 5;
                    }
                    column(UnitOfMeasure_AssemblyLine; GetUOMText("Unit of Measure Code"))
                    {
                    }
                    column(VariantCode_AssemblyLine; "Variant Code")
                    {
                    }

                    trigger OnPreDataItem()
                    var
                        ValueEntry: Record "Value Entry";
                    begin
                        Clear(AssemblyLine);
                        if not DisplayAssemblyInformation then
                            CurrReport.Break();
                        GetAssemblyLinesForDocument(
                          AssemblyLine, ValueEntry."Document Type"::"Sales Shipment", Line."Document No.", Line."Line No.");
                    end;
                }

                trigger OnAfterGetRecord()
                var
                    EnvironmentInfo: Codeunit "Environment Information";
                    Item: Record Item;
                    ItemCrossRef: Record "Item Cross Reference";
                    itemReference: Record "Item Reference";

                begin
                    if Type = Type::"G/L Account" then
                        "No." := '';

                    if type = Type::"G/L Account" then
                        CurrReport.Skip();

                    if type = type::Item then begin
                        if item.Get("No.") then begin
                            ConsumerUOMCode := '';
                            GTIN := '';
                            if item.Type <> Item.type::Inventory then begin
                                CurrReport.skip;
                            end else begin
                                ConsumerUOMCode := item."Consumer Unit of Measure";
                                GTIN := item.GTIN;
                            end;
                        end
                    end;

                    ItemCrossRef.SetRange("Item No.", "No.");
                    ItemCrossRef.SetRange("Cross-Reference Type No.", '1010000');
                    If ItemCrossRef.FindFirst then
                        CustomerItemRef := ItemCrossRef."Cross-Reference No."
                    else
                        CustomerItemRef := '';

                    if CustomerItemRef = '' then begin
                        itemReference.SetRange("Item No.", "No.");
                        itemReference.SetRange("Reference Type No.", '1010000');
                        If itemReference.FindFirst then
                            CustomerItemRef := itemReference."Reference No."
                        else
                            CustomerItemRef := '';
                    end;

                    OnBeforeLineOnAfterGetRecord(Header, Line);

                    if FirstLineHasBeenOutput then
                        Clear(DummyCompanyInfo.Picture);
                    FirstLineHasBeenOutput := true;

                    if ("Job No." <> '') and (not EnvironmentInfo.IsSaaS()) then
                        JobNo := ''
                    else
                        JobNo := "Job No.";
                    if ("Job Task No." <> '') and (not EnvironmentInfo.IsSaaS()) then
                        JobTaskNo := ''
                    else
                        JobTaskNo := "Job Task No.";

                    if JobTaskNo <> '' then begin
                        JobTaskNoLabel := JobTaskNoLbl;
                        JobTaskDescription := GetJobTaskDescription(JobNo, JobTaskNo);
                    end else begin
                        JobTaskDescription := '';
                        JobTaskNoLabel := '';
                    end;

                    if JobNo <> '' then
                        JobNoLabel := JobNoLbl
                    else
                        JobNoLabel := '';

                    if HasTypeToFillMandatoryFields() then
                        FormattedQuantity := Format(Quantity)
                    else
                        FormattedQuantity := '';
                end;

                trigger OnPreDataItem()
                begin
                    MoreLines := Find('+');
                    while MoreLines and (Description = '') and ("No." = '') and (Quantity = 0) do
                        MoreLines := Next(-1) <> 0;
                    if not MoreLines then
                        CurrReport.Break();
                    SetRange("Line No.", 0, "Line No.");
                    FirstLineHasBeenOutput := false;
                    DummyCompanyInfo.Picture := CompanyInfo.Picture;

                    OnAfterLineOnPreDataItem(Header, Line);
                end;

                trigger OnPostDataItem()
                var
                    TempLocalTrackingSpecBuffer: Record "Tracking Specification" temporary;
                begin
                    if ShowLotSN then begin
                        ItemTrackingDocMgt.SetRetrieveAsmItemTracking(true);
                        TrackingSpecCount :=
                          ItemTrackingDocMgt.RetrieveDocumentItemTracking(TempLocalTrackingSpecBuffer,
                            Header."No.", DATABASE::"Sales Shipment Header", 0);
                        ItemTrackingDocMgt.SetRetrieveAsmItemTracking(false);
                        UpdateTrackingSpecBuffer(TempLocalTrackingSpecBuffer);
                    end;
                end;
            }
            dataitem(ItemTrackingLine; "Integer")
            {
                DataItemTableView = SORTING(Number);
                column(TrackingSpecBufferEntryNo; TempTrackingSpecBuffer."Entry No.")
                {
                }
                column(TrackingSpecBufferNo; TempTrackingSpecBuffer."Item No.")
                {
                }
                column(TrackingSpecBufferDesc; TempTrackingSpecBuffer.Description)
                {
                }
                column(TrackingSpecBufferLotNo; TempTrackingSpecBuffer."Lot No.")
                {
                }
                column(TrackingSpecBufferSerNo; TempTrackingSpecBuffer."Serial No.")
                {
                }
                column(TrackingSpecBufferQty; TempTrackingSpecBuffer."Quantity (Base)")
                {
                }
                column(QuantityCaption; QuantityCaptionLbl)
                {
                }
                column(SerialNoCaption; SerialNoCaptionLbl)
                {
                }
                column(LotNoCaption; LotNoCaptionLbl)
                {
                }
                column(DescriptionCaption; DescriptionCaptionLbl)
                {
                }
                column(NoCaption; NoCaptionLbl)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    if Number = 1 then
                        TempTrackingSpecBuffer.FindSet()
                    else
                        TempTrackingSpecBuffer.Next();
                end;

                trigger OnPreDataItem()
                begin
                    if TrackingSpecCount = 0 then
                        CurrReport.Break();
                    SetRange(Number, 1, TempTrackingSpecBuffer.Count());
                end;
            }
            dataitem(WorkDescriptionLines; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 .. 99999));
                column(WorkDescriptionLineNumber; Number)
                {
                }
                column(WorkDescriptionLine; WorkDescriptionLine)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    if WorkDescriptionInstream.EOS then
                        CurrReport.Break();
                    WorkDescriptionInstream.ReadText(WorkDescriptionLine);
                end;

                trigger OnPostDataItem()
                begin
                    Clear(WorkDescriptionInstream)
                end;

                trigger OnPreDataItem()
                begin
                    if not ShowWorkDescription then
                        CurrReport.Break();
                    Header."Work Description".CreateInStream(WorkDescriptionInstream, TEXTENCODING::UTF8);
                end;
            }
            dataitem(LeftHeader; "Name/Value Buffer")
            {
                DataItemTableView = SORTING(ID);
                UseTemporary = true;
                column(LeftHeaderName; Name)
                {
                }
                column(LeftHeaderValue; Value)
                {
                }
            }
            dataitem(RightHeader; "Name/Value Buffer")
            {
                DataItemTableView = SORTING(ID);
                UseTemporary = true;
                column(RightHeaderName; Name)
                {
                }
                column(RightHeaderValue; Value)
                {
                }
            }
            dataitem(LetterText; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                column(GreetingText; GreetingLbl)
                {
                }
                column(BodyText; BodyLbl)
                {
                }
                column(ClosingText; ClosingLbl)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                CurrReport.Language := Language.GetLanguageIdOrDefault("Language Code");

                if not IsReportInPreviewMode() then
                    CODEUNIT.Run(CODEUNIT::"Sales Shpt.-Printed", Header);

                CalcFields("Work Description");
                ShowWorkDescription := "Work Description".HasValue;

                FormatAddressFields(Header);
                FormatDocumentFields(Header);
                if SellToContact.Get("Sell-to Contact No.") then;
                if BillToContact.Get("Bill-to Contact No.") then;

                FillLeftHeader();
                FillRightHeader();

                if not Cust.Get("Bill-to Customer No.") then
                    Clear(Cust);

                OnAfterGetSalesHeader(Header);
            end;

            trigger OnPreDataItem()
            begin
                FirstLineHasBeenOutput := false;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(LogInteractionControl; LogInteraction)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ToolTip = 'Specifies that interactions with the contact are logged.';
                    }
                    field(DisplayAsmInformation; DisplayAssemblyInformation)
                    {
                        ApplicationArea = Assembly;
                        Caption = 'Show Assembly Components';
                        ToolTip = 'Specifies if you want the report to include information about components that were used in linked assembly orders that supplied the item(s) being sold. (Only possible for RDLC report layout.)';
                    }
                    field("Show Correction Lines"; ShowCorrectionLines)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Correction Lines';
                        ToolTip = 'Specifies if the correction lines of an undoing of quantity posting will be shown on the report.';
                    }
                    field(ShowLotSNControl; ShowLotSN)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Serial/Lot Number Appendix';
                        ToolTip = 'Specifies if you want to print an appendix to the sales shipment report showing the lot and serial numbers in the shipment.';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit()
        begin
            LogInteractionEnable := true;
        end;

        trigger OnOpenPage()
        begin
            InitLogInteraction();
            LogInteractionEnable := LogInteraction;
        end;
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        GLSetup.Get();
        CompanyInfo.SetAutoCalcFields(Picture);
        CompanyInfo.Get();
        SalesSetup.Get();
    end;

    trigger OnPostReport()
    begin
        if LogInteraction and not IsReportInPreviewMode() then
            if Header.FindSet() then
                repeat
                    if Header."Bill-to Contact No." <> '' then
                        SegManagement.LogDocument(
                          4, Header."No.", 0, 0, DATABASE::Contact, Header."Bill-to Contact No.", Header."Salesperson Code",
                          Header."Campaign No.", Header."Posting Description", '')
                    else
                        SegManagement.LogDocument(
                          4, Header."No.", 0, 0, DATABASE::Customer, Header."Bill-to Customer No.", Header."Salesperson Code",
                          Header."Campaign No.", Header."Posting Description", '');
                until Header.Next() = 0;
    end;

    trigger OnPreReport()
    begin
        if Header.GetFilters = '' then
            Error(NoFilterSetErr);

        if not CurrReport.UseRequestPage then
            InitLogInteraction();

        CompanyLogoPosition := SalesSetup."Logo Position on Documents";
    end;

    var
        CustomerItemRef: code[20];
        ConsumerUOMCode: code[20];
        GTIN: Code[50];
        GLSetup: Record "General Ledger Setup";
        ShipmentMethod: Record "Shipment Method";
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        CompanyInfo: Record "Company Information";
        DummyCompanyInfo: Record "Company Information";
        SalesSetup: Record "Sales & Receivables Setup";
        Cust: Record Customer;
        RespCenter: Record "Responsibility Center";
        SellToContact: Record Contact;
        BillToContact: Record Contact;
        TempTrackingSpecBuffer: Record "Tracking Specification" temporary;
        Language: Codeunit Language;
        FormatAddr: Codeunit "Format Address";
        FormatDocument: Codeunit "Format Document";
        SegManagement: Codeunit SegManagement;
        ItemTrackingDocMgt: Codeunit "Item Tracking Doc. Management";
        WorkDescriptionInstream: InStream;
        JobNo: Code[20];
        JobTaskNo: Code[20];
        WorkDescriptionLine: Text;
        CustAddr: array[8] of Text[100];
        ShipToAddr: array[8] of Text[100];
        CompanyAddr: array[8] of Text[100];
        SalesPersonText: Text[50];
        JobNoLabel: Text;
        JobTaskNoLabel: Text;
        FormattedQuantity: Text;
        MoreLines: Boolean;
        ShowWorkDescription: Boolean;
        ShowCustAddr: Boolean;
        LogInteraction: Boolean;
        [InDataSet]
        LogInteractionEnable: Boolean;
        DisplayAssemblyInformation: Boolean;
        ShowCorrectionLines: Boolean;
        ShowLotSN: Boolean;
        CompanyLogoPosition: Integer;
        TrackingSpecCount: Integer;
        FirstLineHasBeenOutput: Boolean;
        NoFilterSetErr: Label 'You must specify one or more filters to avoid accidently printing all documents.';
        GreetingLbl: Label 'Hello';
        ClosingLbl: Label 'Sincerely';
        BodyLbl: Label 'Thank you for your business. Your shipment is attached to this message.';
        FromLbl: Label 'From';
        BilledToLbl: Label 'Billed to';
        QuestionsLbl: Label 'Questions?';
        ThanksLbl: Label 'Thank You!';
        JobNoLbl: Label 'Job No.';
        JobTaskNoLbl: Label 'Job Task No.';
        JobTaskDescription: Text[100];
        JobTaskDescLbl: Label 'Job Task Description';
        UnitLbl: Label 'Unit';
        QtyLbl: Label 'Qty', Comment = 'Short form of Quantity';
        SalespersonLbl: Label 'Salesperson';
        CompanyInfoBankAccNoLbl: Label 'Account No.';
        CompanyInfoBankNameLbl: Label 'Bank';
        CompanyInfoGiroNoLbl: Label 'Giro No.';
        CompanyInfoPhoneNoLbl: Label 'Phone No.';
        CopyLbl: Label 'Copy';
        EMailLbl: Label 'Email';
        HomePageLbl: Label 'Home Page';
        ShipmentNoLbl: Label 'Shipment No.';
        PageLbl: Label 'Page';
        PostedShipmentDateLbl: Label 'Shipment Date';
        SalesShipmentLbl: Label 'Shipment';
        YourSalesShipmentLbl: Label 'Your Shipment';
        ShipmentLbl: Label 'Shipment';
        ShiptoAddrLbl: Label 'Ship-to Address';
        ShptMethodDescLbl: Label 'Shipment Method';
        SubtotalLbl: Label 'Subtotal';
        TotalLbl: Label 'Total';
        SellToContactPhoneNoLbl: Label 'Sell-to Contact Phone No.';
        SellToContactMobilePhoneNoLbl: Label 'Sell-to Contact Mobile Phone No.';
        SellToContactEmailLbl: Label 'Sell-to Contact E-Mail';
        BillToContactPhoneNoLbl: Label 'Bill-to Contact Phone No.';
        BillToContactMobilePhoneNoLbl: Label 'Bill-to Contact Mobile Phone No.';
        BillToContactEmailLbl: Label 'Bill-to Contact E-Mail';
        BilltoAddressCaptionLbl: Label 'Bill-to Address';
        QuantityCaptionLbl: Label 'Quantity';
        SerialNoCaptionLbl: Label 'Serial No.';
        LotNoCaptionLbl: Label 'Lot No.';
        DescriptionCaptionLbl: Label 'Description';
        NoCaptionLbl: Label 'No.';
        PurchaseOrderNoLbl: Label 'Purchase Order No.';
        OurDocumentNoLbl: Label 'Our Document No.';

    local procedure InitLogInteraction()
    begin
        LogInteraction := SegManagement.FindInteractTmplCode(4) <> '';
    end;

    local procedure DocumentCaption(): Text
    var
        DocCaption: Text;
    begin
        OnBeforeGetDocumentCaption(Header, DocCaption);
        if DocCaption <> '' then
            exit(DocCaption);
        exit(SalesShipmentLbl);
    end;

    procedure InitializeRequest(NewLogInteraction: Boolean; DisplayAsmInfo: Boolean; NewShowCorrectionLines: Boolean; NewShowLotSN: Boolean)
    begin
        LogInteraction := NewLogInteraction;
        DisplayAssemblyInformation := DisplayAsmInfo;
        ShowCorrectionLines := NewShowCorrectionLines;
        ShowLotSN := NewShowLotSN;
    end;

    local procedure UpdateTrackingSpecBuffer(var LocalTrackingSpecBuffer: Record "Tracking Specification" temporary)
    var
        ItemNo: Code[20];
        ItemTotalQty: Decimal;
        EntryNo: Integer;
        FirstRow: Boolean;
    begin
        if not ShowCorrectionLines then
            LocalTrackingSpecBuffer.SetRange(Correction, false);
        if LocalTrackingSpecBuffer.FindSet() then begin
            ItemNo := LocalTrackingSpecBuffer."Item No.";
            FirstRow := true;
            repeat
                if ItemNo <> LocalTrackingSpecBuffer."Item No." then begin
                    EntryNo += 1;
                    TempTrackingSpecBuffer.Init();
                    TempTrackingSpecBuffer."Entry No." := EntryNo;
                    TempTrackingSpecBuffer."Quantity (Base)" := ItemTotalQty;
                    TempTrackingSpecBuffer.Insert();
                    ItemTotalQty := 0;
                    FirstRow := true;
                end;
                if LocalTrackingSpecBuffer.Correction then
                    LocalTrackingSpecBuffer."Quantity (Base)" := -LocalTrackingSpecBuffer."Quantity (Base)";
                TempTrackingSpecBuffer.TransferFields(LocalTrackingSpecBuffer);
                EntryNo += 1;
                TempTrackingSpecBuffer."Entry No." := EntryNo;
                if not FirstRow then begin
                    TempTrackingSpecBuffer."Item No." := '';
                    TempTrackingSpecBuffer.Description := '';
                end;
                TempTrackingSpecBuffer.Insert();

                ItemNo := LocalTrackingSpecBuffer."Item No.";
                ItemTotalQty := ItemTotalQty + LocalTrackingSpecBuffer."Quantity (Base)";
                if FirstRow then
                    FirstRow := false;
            until LocalTrackingSpecBuffer.Next() = 0;

            EntryNo += 1;
            TempTrackingSpecBuffer.Init();
            TempTrackingSpecBuffer."Entry No." := EntryNo;
            TempTrackingSpecBuffer."Quantity (Base)" := ItemTotalQty;
            TempTrackingSpecBuffer.Insert();
        end;
    end;

    local procedure IsReportInPreviewMode(): Boolean
    var
        MailManagement: Codeunit "Mail Management";
    begin
        exit(CurrReport.Preview or MailManagement.IsHandlingGetEmailBody());
    end;

    local procedure GetUOMText(UOMCode: Code[10]): Text[50]
    var
        UnitOfMeasure: Record "Unit of Measure";
    begin
        if not UnitOfMeasure.Get(UOMCode) then
            exit(UOMCode);
        exit(UnitOfMeasure.Description);
    end;

    local procedure FillLeftHeader()
    begin
        LeftHeader.DeleteAll();

        FillNameValueTable(LeftHeader, Header.FieldCaption("Sell-to Customer No."), Header."Sell-to Customer No.");
        FillNameValueTable(LeftHeader, Header.FieldCaption("Document Date"), Format(Header."Document Date"));
        FillNameValueTable(LeftHeader, ShipmentNoLbl, Header."No.");
        FillNameValueTable(LeftHeader, Header.FieldCaption("Shipment Date"), Format(Header."Shipment Date"));
        FillNameValueTable(LeftHeader, PurchaseOrderNoLbl, Header."External Document No.");
        FillNameValueTable(LeftHeader, OurDocumentNoLbl, Header."Order No.");
    end;

    local procedure FillRightHeader()
    begin
        RightHeader.DeleteAll();

        FillNameValueTable(RightHeader, EMailLbl, CompanyInfo."E-Mail");
        FillNameValueTable(RightHeader, HomePageLbl, CompanyInfo."Home Page");
        FillNameValueTable(RightHeader, CompanyInfoPhoneNoLbl, CompanyInfo."Phone No.");
        FillNameValueTable(RightHeader, CompanyInfo.GetRegistrationNumberLbl(), CompanyInfo.GetRegistrationNumber());
        FillNameValueTable(RightHeader, CompanyInfoBankNameLbl, CompanyInfo."Bank Name");
        FillNameValueTable(RightHeader, CompanyInfoGiroNoLbl, CompanyInfo."Giro No.");
        FillNameValueTable(RightHeader, CompanyInfo.FieldCaption(IBAN), CompanyInfo.IBAN);
        FillNameValueTable(RightHeader, CompanyInfo.FieldCaption("SWIFT Code"), CompanyInfo."SWIFT Code");
    end;

    local procedure FillNameValueTable(var NameValueBuffer: Record "Name/Value Buffer"; Name: Text; Value: Text)
    var
        KeyIndex: Integer;
    begin
        if Value <> '' then begin
            Clear(NameValueBuffer);
            if NameValueBuffer.FindLast() then
                KeyIndex := NameValueBuffer.ID + 1;

            NameValueBuffer.Init();
            NameValueBuffer.ID := KeyIndex;
            NameValueBuffer.Name := CopyStr(Name, 1, MaxStrLen(NameValueBuffer.Name));
            NameValueBuffer.Value := CopyStr(Value, 1, MaxStrLen(NameValueBuffer.Value));
            NameValueBuffer.Insert();
        end;
    end;

    local procedure FormatAddressFields(var SalesShipmentHeader: Record "Sales Shipment Header")
    begin
        FormatAddr.GetCompanyAddr(SalesShipmentHeader."Responsibility Center", RespCenter, CompanyInfo, CompanyAddr);
        FormatAddr.SalesShptBillTo(CustAddr, ShipToAddr, SalesShipmentHeader);
        FormatAddr.SalesShptShipTo(ShipToAddr, SalesShipmentHeader);
        ShowCustAddr := FormatAddr.SalesShptBillTo(CustAddr, ShipToAddr, SalesShipmentHeader);
    end;

    local procedure FormatDocumentFields(SalesShipmentHeader: Record "Sales Shipment Header")
    begin
        FormatDocument.SetSalesPerson(SalespersonPurchaser, SalesShipmentHeader."Salesperson Code", SalesPersonText);
        FormatDocument.SetShipmentMethod(ShipmentMethod, SalesShipmentHeader."Shipment Method Code", SalesShipmentHeader."Language Code");
    end;

    local procedure GetJobTaskDescription(JobNo: Code[20]; JobTaskNo: Code[20]): Text[100]
    var
        JobTask: Record "Job Task";
    begin
        JobTask.SetRange("Job No.", JobNo);
        JobTask.SetRange("Job Task No.", JobTaskNo);
        if JobTask.FindFirst() then
            exit(JobTask.Description);

        exit('');
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterLineOnPreDataItem(var SalesShipmentHeader: Record "Sales Shipment Header"; var SalesShipmentLine: Record "Sales Shipment Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeLineOnAfterGetRecord(var SalesShipmentHeader: Record "Sales Shipment Header"; var SalesShipmentLine: Record "Sales Shipment Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetDocumentCaption(SalesShipmentHeader: Record "Sales Shipment Header"; var DocCaption: Text)
    begin
    end;

    [IntegrationEvent(TRUE, FALSE)]
    local procedure OnAfterGetSalesHeader(SalesShipmentHeader: Record "Sales Shipment Header")
    begin
    end;
}



