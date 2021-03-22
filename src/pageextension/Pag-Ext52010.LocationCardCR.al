/// <summary>
/// PageExtension "LocationCardCR" (ID 52010) extends Record Location Card.
/// </summary>
pageextension 52010 LocationCardCR extends "Location Card"
{
    layout
    {
        addafter("Inbound Whse. Handling Time")
        {
            field("Auto. Create Shipment & Pick"; Rec."Auto. Create Shipment & Pick")
            {
                ApplicationArea = All;
                ToolTip = 'Enable for automatic creation of warehouse shipments and picks providing stock is available';
            }
        }
    }
}
