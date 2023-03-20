page 51000 PowerAppsSamplePage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                Caption = 'PowerApp Tables';
                part(PowerAppCustomers; PowerCustomerListPart)
                {
                    Caption = 'Customers';
                }
            }
            group(GroupName2)
            {
                Caption = 'PowerApp Items';

                part(PowerAppItems; PowerItemListPart)
                {
                    Caption = 'Items';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(GenerateTestDate)
            {
                ApplicationArea = All;
                Promoted = true;
                Caption = 'Generate PowerApp Data';
                trigger OnAction()
                var
                    myCodeUnit: Codeunit PowerAppsDemoDataGenerator;
                begin
                    myCodeUnit.GenerateDemoDataForTakeMyOrder();
                end;
            }
        }
    }

    var
        myInt: Integer;
}