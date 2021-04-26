pageextension 52019 "RoutingCR" extends Routing
{
    layout
    {
        addafter("Search Description")
        {
            field("Location Code CR"; rec."Location Code CR")
            {
                ApplicationArea = All;
            }
        }
    }
}
