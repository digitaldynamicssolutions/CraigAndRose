/// <summary>
/// PageExtension SalesSetup (ID 52002) extends Record Sales Receivables Setup.
/// </summary>
pageextension 52002 "SalesSetupCR" extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Dynamics 365 Sales")
        {
            group(OTM)
            {

                field("OTM Order E-mail Address"; Rec."OTM Order E-mail Address")
                {
                    Caption = 'OTM Order E-mail Address';
                    ApplicationArea = All;
                    ToolTip = 'Specify the email recipient for the order lines to be sent to.';
                }
                field("OTM E-mail Subject Text"; Rec."OTM E-mail Subject Text")
                {
                    Caption = 'OTM E-mail Subject Text';
                    ApplicationArea = All;
                    ToolTip = 'Specify the email subject sent for the order lines email';
                }
                field("OTM E-mail Body Text"; Rec."OTM E-mail Body Text")
                {
                    Caption = 'OTM E-mail Body Text';
                    ApplicationArea = All;
                    ToolTip = 'Specify the email body sent for the order lines email';
                }
                field("OTM Order Posting Delay (Days)"; Rec."OTM Order Posting Delay (Days)")
                {
                    Caption = 'OTM Order Posting Delay (Days)';
                    ApplicationArea = All;
                    ToolTip = 'Specify the number of days for the order to be with OTM beofre automatically posting, for 2 days enter "-2D". ';
                }
                field("OTM Location Code"; Rec."OTM Location Code")
                {
                    Caption = 'OTM Location Code';
                    ApplicationArea = All;
                    ToolTip = 'This determines the location used for OTM.';
                }
            }

        }
    }
}