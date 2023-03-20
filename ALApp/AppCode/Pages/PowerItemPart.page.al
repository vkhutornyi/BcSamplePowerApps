page 51005 PowerItemListPart
{
    PageType = ListPart;
    SourceTable = Item;
    SourceTableView = where(SoldInRestaurant = const(true));

    layout
    {
        area(Content)
        {
            repeater(CustomerInformation)
            {
                field(ItemNumber; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(ItemName; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(showInPowerApp; Rec.SoldInRestaurant)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}