codeunit 51000 BCS_WH_LabelManagement
{
    // // Codeunit for generating the static values that Power BI reports use for titles or other
    // // text labels. These values are exposed through a web service for page 6318. This approach
    // // lets reports get values translated for the user's locale rather than hardcoding English.

    trigger OnRun()
    begin
    end;

    var
        StartScreen_Scan: Label 'StartScreen_Scan', Locked = true;
        StartScreen_Scan_ValueTxt: Label 'Scan';

        StartScreen_InfoPage: Label 'StartScreen_InfoPage', Locked = true;
        StartScreen_InfoPage_ValueTxt: Label 'Open the information page';

        StartScreen_User: Label 'StartScreen_User', Locked = true;
        StartScreen_User_ValueTxt: Label 'User:';

        Close: Label 'Close', Locked = true;
        Close_ValueTxt: Label 'Close the page';

        Back: Label 'Back', Locked = true;
        Back_ValueTxt: Label 'Go back to the previous page';

        InfoScreen_Title: Label 'InfoScreen_Title', Locked = true;
        InfoScreen_Title_ValueTxt: Label 'Business Central sample App';

        InfoScreen_Text: Label 'InfoScreen_Text', Locked = true;
        InfoScreen_Text_ValueTxt: Label 'Warehouse helper is a simple sample app that shows how to use the Power Apps integration in Business Central.';

        ItemScreen_Submit: Label 'ItemScreen_Submit', Locked = true;
        ItemScreen_Submit_ValueTxt: Label 'Submit';

        ItemScreen_Add: Label 'ItemScreen_Add', Locked = true;
        ItemScreen_Add_ValueTxt: Label 'Add to inventory count';

        ItemScreen_SubStract: Label 'ItemScreen_SubStract', Locked = true;
        ItemScreen_SubStract_ValueTxt: Label 'Remove from inventory count';

        ItemScreen_SubStractBlocked: Label 'ItemScreen_SubStractBlocked', Locked = true;
        ItemScreen_SubStractBlocked_ValueTxt: Label 'You cannot have a negative inventory count';

        NotFoundScreen_Title: Label 'NotFoundScreen_Title', Locked = true;
        NotFoundScreen_Title_ValueTxt: Label 'Scan another item or try again';

        NotFoundScreen_Text: Label 'NotFoundScreen_Text', Locked = true;
        NotFoundScreen_Text_ValueTxt: Label 'We could not find an item that macthes the scanned code';

        NotFoundScreen_Scan: Label 'NotFoundScreen_Scan', Locked = true;
        NotFoundScreen_Scan_ValueTxt: Label 'Scan item';

        SelectWarehouseScreen_Title: Label 'SelectWarehouseScreen_Title', Locked = true;
        SelectWarehouseScreen_Title_ValueTxt: Label 'Select Warehouse';


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
        InsertLabel(TempPowerAppsLabels, StartScreen_Scan, StartScreen_Scan_ValueTxt, 'en-US');
        InsertLabel(TempPowerAppsLabels, StartScreen_InfoPage, StartScreen_InfoPage_ValueTxt, 'en-US');
        InsertLabel(TempPowerAppsLabels, StartScreen_User, StartScreen_User_ValueTxt, 'en-US');
        InsertLabel(TempPowerAppsLabels, Close, Close_ValueTxt, 'en-US');
        InsertLabel(TempPowerAppsLabels, InfoScreen_Title, InfoScreen_Title_ValueTxt, 'en-US');
        InsertLabel(TempPowerAppsLabels, InfoScreen_Text, InfoScreen_Text_ValueTxt, 'en-US');
        InsertLabel(TempPowerAppsLabels, ItemScreen_Submit, ItemScreen_Submit_ValueTxt, 'en-US');
        InsertLabel(TempPowerAppsLabels, ItemScreen_Add, ItemScreen_Add_ValueTxt, 'en-US');
        InsertLabel(TempPowerAppsLabels, ItemScreen_SubStract, ItemScreen_SubStract_ValueTxt, 'en-US');
        InsertLabel(TempPowerAppsLabels, ItemScreen_SubStractBlocked, ItemScreen_SubStractBlocked_ValueTxt, 'en-US');
        InsertLabel(TempPowerAppsLabels, NotFoundScreen_Title, NotFoundScreen_Title_ValueTxt, 'en-US');
        InsertLabel(TempPowerAppsLabels, NotFoundScreen_Text, NotFoundScreen_Text_ValueTxt, 'en-US');
        InsertLabel(TempPowerAppsLabels, NotFoundScreen_Scan, NotFoundScreen_Scan_ValueTxt, 'en-US');
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

