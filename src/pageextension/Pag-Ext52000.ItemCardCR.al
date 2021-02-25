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
                ApplicationArea = All;
                ToolTip = 'Set this to the default shipping location if its not the main warehouse location';
            }
        }
    }
}
