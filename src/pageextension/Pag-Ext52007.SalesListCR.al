/// <summary>
/// PageExtension "SalesListCR" (ID 52007) extends Record Sales List.
/// </summary>
pageextension 52007 SalesListCR extends "Sales List"
{

    layout
    {
        addafter("Location Code")
        {
            field("Progress Status CR"; rec."Progress Status CR")
            {
                ApplicationArea = All;
                StyleExpr = 'Strong';
            }
        }
    }
}
