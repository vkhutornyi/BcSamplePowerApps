codeunit 51002 BCS_TO_LabelManagement
{
    // // Codeunit for generating the static values that Power BI reports use for titles or other
    // // text labels. These values are exposed through a web service for page 6318. This approach
    // // lets reports get values translated for the user's locale rather than hardcoding English.

    trigger OnRun()
    begin
    end;

    var
        StartScreen_TakeOrder: Label 'StartScreen_TakeOrder', Locked = true;
        StartScreen_TakeOrder_ValueTxt: Label 'Take Order';
        StartScreen_User: Label 'StartScreen_User', Locked = true;
        StartScreen_User_ValueTxt: Label 'User:';
        StartScreen_InfoScreen: Label 'StartScreen_InfoScreen', Locked = true;
        StartScreen_InfoScreen_ValueTxt: Label 'Open about screen';
        InfoScreen_Close: Label 'InfoScreen_Close', Locked = true;
        InfoScreen_Close_ValueTxt: Label 'Close the page';
        InfoScreen_Title: Label 'InfoScreen_Title', Locked = true;
        InfoScreen_Title_ValueTxt: Label 'Business Central sample app';
        InfoScreen_Text: Label 'InfoScreen_Text', Locked = true;
        InfoScreen_Text_ValueTxt: Label '"Take order" is a Business Central sample app. The app is meant as an inspiration on how you can build a high fidelity canvas app using the Business Central connector. Read more about Business Central sample apps at https://aka.ms/BcPApps';
        SelectTableScreen_Title: Label 'SelectTableScreen_Title', Locked = true;
        SelectTableScreen_Title_ValueTxt: Label 'Select table';
        SelectTableScreen_Free: Label 'SelectTableScreen_Free', Locked = true;
        SelectTableScreen_Free_ValueTxt: Label 'Free';
        SelectTableScreen_Occupied: Label 'SelectTableScreen_Occupied', Locked = true;
        SelectTableScreen_Occupied_ValueTxt: Label 'Occupied';
        SelectTableScreen_Update: Label 'SelectTableScreen_Update', Locked = true;
        SelectTableScreen_Update_ValueTxt: Label 'Refresh the list';
        TakeOrderScreen_FullMenu: Label 'TakeOrderScreen_FullMenu', Locked = true;
        TakeOrderScreen_FullMenu_ValueTxt: Label 'Full menu';
        TakeOrderScreen_Items: Label 'TakeOrderScreen_Items', Locked = true;
        TakeOrderScreen_Items_ValueTxt: Label 'Items:';
        TakeOrderScreen_Totals: Label 'TakeOrderScreen_Totals', Locked = true;
        TakeOrderScreen_Totals_ValueTxt: Label 'Total:';
        TakeOrderScreen_Review: Label 'TakeOrderScreen_Review', Locked = true;
        TakeOrderScreen_Review_ValueTxt: Label 'Review';
        TakeOrderScreen_Close: Label 'TakeOrderScreen_Close', Locked = true;
        TakeOrderScreen_Close_ValueTxt: Label 'Close the list';
        TakeOrderScreen_Delete: Label 'TakeOrderScreen_Delete', Locked = true;
        TakeOrderScreen_Delete_ValueTxt: Label 'Delete the selection';
        SummaryScreen_Delete: Label 'SummaryScreen_Delete', Locked = true;
        SummaryScreen_Delete_ValueTxt: Label 'Delete the order';
        SummaryScreen_Back: Label 'SummaryScreen_Back', Locked = true;
        SummaryScreen_Back_ValueTxt: Label 'Go back to the previous page';
        SummaryScreen_Submit: Label 'SummaryScreen_Submit', Locked = true;
        SummaryScreen_Submit_ValueTxt: Label 'Submit';
        SummaryScreen_AddMore: Label 'SummaryScreen_AddMore', Locked = true;
        SummaryScreen_AddMore_ValueTxt: Label '+ Add more';
        SummaryScreen_CheckOut: Label 'SummaryScreen_CheckOut', Locked = true;
        SummaryScreen_CheckOut_ValueTxt: Label 'Checkout';
        SummaryScreen_Total: Label 'SummaryScreen_Total', Locked = true;
        SummaryScreen_Total_ValueTxt: Label 'Total:';
        SummaryScreen_DeleteMessage: Label 'SummaryScreen_DeleteMessage', Locked = true;
        SummaryScreen_DeleteMessage_ValueTxt: Label 'Are you sure you want to cancel the order?';
        SummaryScreen_CheckOutMessage: Label 'SummaryScreen_CheckOutMessage', Locked = true;
        SummaryScreen_CheckOutMessage_ValueTxt: Label 'Are you sure you want to check out and close the order?';


        // Telemetry labels
        LabelsGeneratedTelemetryTxt: Label 'Retrieving Power Apps labels for language "%1" (system language is "%2").', Locked = true;

    procedure GetLabelsForUserLanguage(var TempPowerAppsLabels: Record BCS_Labels temporary; languageFilter: Text)
    var
        DotNetCultureInfo: Codeunit DotNet_CultureInfo;
        LanguageChanged: Boolean;
        PreviousLanguage: Integer;
        LanguageCodeId: Integer;
    begin

        // DotNetCultureInfo.GetCultureInfoByName(languageFilter);
        // Call function that does not exist to get the language code ID

        // Temp code - see comment above about language code ID
        if languageFilter = 'da-dk' then begin
            PreviousLanguage := GlobalLanguage();
            LanguageCodeId := 1030;
            GlobalLanguage(LanguageCodeId);
            LanguageChanged := true;
        end;

        GetReportLabels(TempPowerAppsLabels);
        OnAfterGeneratePowerAppsLabels(TempPowerAppsLabels);

        if LanguageChanged then
            GlobalLanguage(PreviousLanguage);
    end;

    procedure GetReportLabels(var TempPowerAppsLabels: Record BCS_Labels temporary)
    begin
        // Fills the given temp table with all the default key-value pairs hardcoded into this codeunit.
        // Key text should always be locked, and Value text should always be translated.
        InsertLabel(TempPowerAppsLabels, StartScreen_TakeOrder, StartScreen_TakeOrder_ValueTxt, 'en-US');
        InsertLabel(TempPowerAppsLabels, StartScreen_User, StartScreen_User_ValueTxt, 'en-US');
        InsertLabel(TempPowerAppsLabels, StartScreen_InfoScreen, StartScreen_InfoScreen_ValueTxt, 'en-US');
        InsertLabel(TempPowerAppsLabels, InfoScreen_Title, InfoScreen_Title_ValueTxt, 'en-US');
        InsertLabel(TempPowerAppsLabels, InfoScreen_Text, InfoScreen_Text_ValueTxt, 'en-US');
        insertLabel(TempPowerAppsLabels, InfoScreen_Close, InfoScreen_Close_ValueTxt, 'en-US');
        InsertLabel(TempPowerAppsLabels, SelectTableScreen_Title, SelectTableScreen_Title_ValueTxt, 'en-US');
        InsertLabel(TempPowerAppsLabels, SelectTableScreen_Free, SelectTableScreen_Free_ValueTxt, 'en-US');
        InsertLabel(TempPowerAppsLabels, SelectTableScreen_Occupied, SelectTableScreen_Occupied_ValueTxt, 'en-US');
        InsertLabel(TempPowerAppsLabels, SelectTableScreen_Update, SelectTableScreen_Update_ValueTxt, 'en-US');
        InsertLabel(TempPowerAppsLabels, TakeOrderScreen_FullMenu, TakeOrderScreen_FullMenu_ValueTxt, 'en-US');
        InsertLabel(TempPowerAppsLabels, TakeOrderScreen_Items, TakeOrderScreen_Items_ValueTxt, 'en-US');
        InsertLabel(TempPowerAppsLabels, TakeOrderScreen_Totals, TakeOrderScreen_Totals_ValueTxt, 'en-US');
        InsertLabel(TempPowerAppsLabels, TakeOrderScreen_Review, TakeOrderScreen_Review_ValueTxt, 'en-US');
        InsertLabel(TempPowerAppsLabels, TakeOrderScreen_Close, TakeOrderScreen_Close_ValueTxt, 'en-US');
        InsertLabel(TempPowerAppsLabels, TakeOrderScreen_Delete, TakeOrderScreen_Delete_ValueTxt, 'en-US');
        InsertLabel(TempPowerAppsLabels, SummaryScreen_Delete, SummaryScreen_Delete_ValueTxt, 'en-US');
        InsertLabel(TempPowerAppsLabels, SummaryScreen_Back, SummaryScreen_Back_ValueTxt, 'en-US');
        InsertLabel(TempPowerAppsLabels, SummaryScreen_Submit, SummaryScreen_Submit_ValueTxt, 'en-US');
        InsertLabel(TempPowerAppsLabels, SummaryScreen_AddMore, SummaryScreen_AddMore_ValueTxt, 'en-US');
        InsertLabel(TempPowerAppsLabels, SummaryScreen_CheckOut, SummaryScreen_CheckOut_ValueTxt, 'en-US');
        InsertLabel(TempPowerAppsLabels, SummaryScreen_Total, SummaryScreen_Total_ValueTxt, 'en-US');
        InsertLabel(TempPowerAppsLabels, SummaryScreen_DeleteMessage, SummaryScreen_DeleteMessage_ValueTxt, 'en-US');
        InsertLabel(TempPowerAppsLabels, SummaryScreen_CheckOutMessage, SummaryScreen_CheckOutMessage_ValueTxt, 'en-US');


    end;

    local procedure InsertLabel(var TempPowerAppsLabels: Record BCS_Labels temporary; LabelName: Text[100]; LabelText: Text[250]; labelLanguage: Text[10])
    begin
        // Inserts the given key-value pair into the temp table.
        TempPowerAppsLabels."Label ID" := LabelName;
        TempPowerAppsLabels."Text Value" := LabelText;
        tempPowerAppsLabels."Language Code" := labelLanguage;
        TempPowerAppsLabels.Insert();
    end;

    [IntegrationEvent(false, false)]
    procedure OnAfterGeneratePowerAppsLabels(var PowerBIReportLabels: Record BCS_Labels temporary)
    begin
    end;
}

