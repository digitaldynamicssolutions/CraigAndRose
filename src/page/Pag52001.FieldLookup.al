/// <summary>
/// Page Field Lookup (ID 52001).
/// </summary>
page 52001 "Field Lookup"
{

    ApplicationArea = All;
    Caption = 'Field Lookup';
    PageType = List;
    SourceTable = "Field Lookup CR";
    SourceTableView = sorting("Lookup Code", Squence, Code);
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Lookup Code"; Rec."Lookup Code")
                {
                    ToolTip = 'Specifies the value of the Lookup Code field';
                    ApplicationArea = All;
                    //Visible = ShowLookupCode;
                }
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

                field(Squence; Rec.Squence)
                {
                    ToolTip = 'Specifies the value of the Squence field';
                    ApplicationArea = All;
                }
                field("Sales Refund Confirmation"; rec."Sales Refund Confirmation")
                {
                    ToolTip = 'This is to be set to promopt the user when entering a cancellation reason to prompt to process any relevant refund';
                    ApplicationArea = All;
                }
            }
        }
    }
    var
        ShowLookupCode: Boolean;

    trigger OnOpenPage()
    begin
        if CurrPage.LookupMode(true) then begin
            ShowLookupCode := false
        end else
            ShowLookupCode := true;
    end;

}
