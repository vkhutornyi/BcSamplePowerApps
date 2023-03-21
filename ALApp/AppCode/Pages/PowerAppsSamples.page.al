page 51000 PowerAppsSamplePage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'PowerApps Sample Page';

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
            action(GenerateTestData)
            {
                ApplicationArea = All;
                Promoted = true;
                Caption = 'Generate PowerApp Data';
                trigger OnAction()
                var
                    myCodeUnit: Codeunit PowerAppsDemoDataGenerator;
                begin
                    myCodeUnit.GenerateDemoDataForPowerApps();
                end;
            }
            action(DeleteTestData)
            {
                ApplicationArea = All;
                Promoted = true;
                Caption = 'Delete PowerApp Data';
                trigger OnAction()
                var
                    myCodeUnit: Codeunit PowerAppsDemoDataGenerator;
                begin
                    myCodeUnit.DeleteDemoDataForPowerApps();
                end;
            }
        }
    }
}