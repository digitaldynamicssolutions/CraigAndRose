tableextension 52015 "RoutingHeaderExtCR" extends "Routing Header"
{
    fields
    {
        field(52000; "Location Code CR"; Code[10])
        {
            Caption = 'Location Code';
            DataClassification = ToBeClassified;
            TableRelation = Location.Code;
        }
    } 
}
