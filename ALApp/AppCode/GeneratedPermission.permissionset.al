permissionset 51000 BCS_Permissions
{
    Assignable = true;
    Permissions = tabledata BCS_Labels = RIMD,
        table BCS_Labels = X,
        codeunit BCS_TO_LabelManagement = X,
        codeunit BCS_WH_LabelManagement = X,
        codeunit BCS_SampleDataGenerator = X,
        codeunit BCS_ItemImages = X,
        page BCS_CustomersWithImage = X,
        page BCS_ItemWithImage = X,
        page BCS_LanguageResources = X,
        page BCS_SamplePage = X,
        page BCS_CustomerListPart = X,
        page BCS_ItemListPart = X;
}