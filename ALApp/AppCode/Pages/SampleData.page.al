page 51000 BCS_SamplePage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'PowerApps Sample data';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                Caption = 'Sample Tables';
                part(PowerAppCustomers; BCS_CustomerListPart)
                {
                    Caption = 'Customers';
                }
            }
            group(GroupName2)
            {
                Caption = 'Sample Items';

                part(PowerAppItems; BCS_ItemListPart)
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
                Caption = 'Generate sample Data';
                trigger OnAction()
                var
                    myCodeUnit: Codeunit BCS_SampleDataGenerator;
                begin
                    myCodeUnit.GenerateDemoDataForPowerApps();
                end;
            }
            action(DeleteTestData)
            {
                ApplicationArea = All;
                Promoted = true;
                Caption = 'Delete sample Data';
                trigger OnAction()
                var
                    myCodeUnit: Codeunit BCS_SampleDataGenerator;
                begin
                    myCodeUnit.DeleteDemoDataForPowerApps();
                end;
            }
        }
    }
}