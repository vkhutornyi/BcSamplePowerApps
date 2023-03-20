tableextension 51000 PowerAppsCustomer extends Customer
{
    fields
    {
        field(51000; IsTable; Boolean)
        {
            Caption = 'Is Table';
            DataClassification = CustomerContent;
        }
    }
}