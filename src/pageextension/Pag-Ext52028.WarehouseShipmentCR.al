/// <summary>
/// PageExtension "WarehouseShipmentCR" (ID 52028) extends Record Warehouse Shipment.
/// </summary>
pageextension 52028 WarehouseShipmentCR extends "Warehouse Shipment"
{
    layout
    {
        addlast(General)
        {
            group("Source Document Details")
            {
                field("Source Order No. CR"; Rec."Source Order No. CR")
                {
                    ToolTip = 'Specifies the value of the Source Order No. field';
                    ApplicationArea = All;
                }
                field("Customer Posting Group CR"; Rec."Customer Posting Group CR")
                {
                    ToolTip = 'Specifies the value of the Customer Posting Group field';
                    ApplicationArea = All;
                }
                field("Source Global Dimension 1 CR"; Rec."Source Global Dimension 1 CR")
                {
                    ToolTip = 'Specifies the value of the Source Global Dimension 1 field';
                    ApplicationArea = All;
                }
                field("Source Global Dimension 2 CR"; Rec."Source Global Dimension 2 CR")
                {
                    ToolTip = 'Specifies the value of the Source Global Dimension 2 field';
                    ApplicationArea = All;
                }
                field("Source Order Date CR"; Rec."Source Order Date CR")
                {
                    ToolTip = 'Specifies the value of the Source Order Date field';
                    ApplicationArea = All;
                }
                field("Source Customer Group CR"; Rec."Source Customer Group CR")
                {
                    ToolTip = 'Specifies the value of the Source Customer Group field';
                    ApplicationArea = All;
                }
            }

            group("Delivery Address")
            {
                field("Source Ship-to Name CR"; Rec."Source Ship-to Name CR")
                {
                    ToolTip = 'Specifies the value of the Source Ship-to Name field';
                    ApplicationArea = All;
                }
                field("Source Ship-to Name 2 CR"; Rec."Source Ship-to Name 2 CR")
                {
                    ToolTip = 'Specifies the value of the Source Ship-to Name 2 field';
                    ApplicationArea = All;
                }
                field("Source Ship-to Address CR"; Rec."Source Ship-to Address CR")
                {
                    ToolTip = 'Specifies the value of the Source Ship-to Address field';
                    ApplicationArea = All;
                }
                field("Source Ship-to Address 2 CR"; Rec."Source Ship-to Address 2 CR")
                {
                    ToolTip = 'Specifies the value of the Source Ship-to Address 2 field';
                    ApplicationArea = All;
                }
                field("Source Ship-to City CR"; Rec."Source Ship-to City CR")
                {
                    ToolTip = 'Specifies the value of the Source Ship-to City field';
                    ApplicationArea = All;
                }
                field("Source Ship-to Post Code CR"; Rec."Source Ship-to Post Code CR")
                {
                    ToolTip = 'Specifies the value of the Source Ship-to Post Code field';
                    ApplicationArea = All;
                }
                field("Source Ship-to County CR"; Rec."Source Ship-to County CR")
                {
                    ToolTip = 'Specifies the value of the Source Ship-to County field';
                    ApplicationArea = All;
                }
                field("Source Ship-to Country/Region Code CR"; Rec."Source Ship-to Country/Reg CR")
                {
                    ToolTip = 'Specifies the value of the Source Ship-to Country/Region Code field';
                    ApplicationArea = All;
                }
                field("Source Ship-to Contact CR"; Rec."Source Ship-to Contact CR")
                {
                    ToolTip = 'Specifies the value of the Source Ship-to Contact field';
                    ApplicationArea = All;
                }
            }
        }
    }
}
