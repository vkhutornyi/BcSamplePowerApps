codeunit 51000 BCS_LabelManagement
{
    // // Codeunit for generating the static values that Power BI reports use for titles or other
    // // text labels. These values are exposed through a web service for page 6318. This approach
    // // lets reports get values translated for the user's locale rather than hardcoding English.

    trigger OnRun()
    begin
    end;

    var
        StartPage_Welcome: Label 'StartPage_Welcome', Locked = true;
        StartPage_Welcome_ValueTxt: Label 'Welcome to the Power App sample app!';
        StartPage_Description: Label 'StartPage_Description', Locked = true;
        StartPage_DeScription_ValueTxt: Label 'This is a description placeholder text.';

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

        InsertLabel(TempPowerAppsLabels, StartPage_Welcome, StartPage_Welcome_ValueTxt, 'en-US');
        InsertLabel(TempPowerAppsLabels, StartPage_Description, StartPage_DeScription_ValueTxt, 'en-US');
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

