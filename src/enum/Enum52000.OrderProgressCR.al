enum 52000 "Order Progress CR"
{
    Extensible = false;

    value(0; " ")
    {
        Caption = ' ';
    }
    value(1; Created)
    {
        Caption = 'Created';
    }
    value(2; Released)
    {
        Caption = 'Released';
    }
    value(3; "Shipment Created")
    {
        Caption = 'Shipment Created';
    }
    value(4; "In Picking")
    {
        Caption = 'In Picking';
    }
    value(5; Picked)
    {
        Caption = 'Picked';
    }
    value(6; Shipped)
    {
        Caption = 'Shipped';
    }
    value(7; Invoiced)
    {
        Caption = 'Invoiced';
    }
    value(8; "Re-Opened")
    {
        Caption = 'Re-Opened';
    }
    value(9; "Shipment Cancelled")
    {
        Caption = 'Shipment Cancelled';
    }
        value(10; "Pick Cancelled")
    {
        Caption = 'Pick Cancelled';
    }
}
