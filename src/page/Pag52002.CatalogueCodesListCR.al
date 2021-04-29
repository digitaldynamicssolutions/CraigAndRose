page 52002 "Catalogue Codes List CR"
{

    ApplicationArea = All;
    Caption = 'Catalogue Codes List';
    PageType = List;
    SourceTable = "Catalogue Codes CR";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Code; Rec.Code)
                {
                    ToolTip = 'Specifies the value of the Code field';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field';
                    ApplicationArea = All;
                }
                field("Purchase G/L Account"; Rec."Purchase G/L Account")
                {
                    ToolTip = 'Specifies the value of the Purchase G/L Account field set on purchase line';
                    ApplicationArea = All;
                }
            }
        }
    }

}
