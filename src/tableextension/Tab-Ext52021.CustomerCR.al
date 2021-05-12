tableextension 52021 "CustomerCR" extends Customer
{
    fields
    {
        field(52000; "Auto Release Sales Orders CR"; Boolean)
        {
            Caption = 'Auto Release Sales Orders';
            DataClassification = ToBeClassified;
        }
    }
}
