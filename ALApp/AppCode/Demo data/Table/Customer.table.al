tableextension 51000 BCS_Customer extends Customer
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