tableextension 52017 "PurchaseLineCR" extends "Purchase Line"
{
    fields
    {
        field(52000; "Catalogue Code CR"; Code[20])
        {
            Caption = 'Catalogue Code';
            DataClassification = ToBeClassified;
            TableRelation = "Catalogue Codes CR".Code;

            trigger OnValidate()
            var
                CatalogueCodeCR: Record "Catalogue Codes CR";
            begin
                if CatalogueCodeCR.Get("Catalogue Code CR") then begin
                    if CatalogueCodeCR."Purchase G/L Account" <> '' then begin
                        if type <> type::"G/L Account" then
                            validate(Type, Type::"G/L Account");
                        Validate("No.", CatalogueCodeCR."Purchase G/L Account");
                        Validate(Description, CatalogueCodeCR.Description);
                        "Catalogue Code CR" := CatalogueCodeCR.code;
                    end;
                end;
            end;
        }
    }
}
