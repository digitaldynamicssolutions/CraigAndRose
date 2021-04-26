/// <summary>
/// PageExtension Item Card CR (ID 50100) extends Record Item Card.
/// </summary>
pageextension 52000 "Item Card CR" extends "Item Card"
{
    layout
    {
        addlast("Prices & Sales")
        {
            field("Default Fulfillment Location CR"; Rec."Default Fulfillment Location")
            {
                Caption = 'Default Fulfillment Location';
                ApplicationArea = All;
                ToolTip = 'Set this to the default shipping location if its not the main warehouse location';
            }
        }

        addafter("Safety Stock Quantity")
        {
            field("Production Order Multiple CR"; rec."Production Order Multiple CR")
            {
                Caption = 'Production Order Multiple';
                ToolTip = 'When automatic production orders are raised it will ensure these orders are at a multiple set here';
                ApplicationArea = All;
            }
        }
    }
}
