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

