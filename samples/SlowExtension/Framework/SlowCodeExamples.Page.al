// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

/// <summary>
/// Provides examples of slowly running code.
/// </summary>
page 50100 "Slow Code Examples"
{
    Caption = 'Slow Code Examples';
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;
    AboutTitle = 'About slow code examples';
    AboutText = 'Use the actions on this page to test performance troubleshooting tools.';

    layout
    {
        area(Content)
        {
            group(Info)
            {
                ShowCaption = false;

                group(VerticalAlignmentInfo)
                {
                    ShowCaption = false;

                    label("Header")
                    {
                        ApplicationArea = All;
                        Caption = 'This page is used for demo & training purposes';
                        Style = Strong;
                    }
                    field(Description; DescriptionTxt)
                    {
                        ApplicationArea = All;
                        Editable = false;
                        ShowCaption = false;
                        MultiLine = true;
                        Caption = ' ';

                    }
                }
            }
            group(Scenarios)
            {
                ShowCaption = false;

                part("Slow Code Examples List"; "Slow Code Examples List")
                {
                    Caption = 'Slow Code Examples';
                    ApplicationArea = All;
                }

                group(Help)
                {
                    ShowCaption = false;

                    label("LinkText")
                    {
                        ApplicationArea = All;
                        Caption = 'For help on how to troubleshoot see:';
                    }
                    field(LearnMore; PerfToolsTxt)
                    {
                        ApplicationArea = All;
                        Editable = false;
                        ShowCaption = false;
                        Caption = ' ';
                        ToolTip = 'View information about performance troubleshooting tools.';

                        trigger OnDrillDown()
                        begin
                            Hyperlink(PerfToolsUrlTxt);
                        end;
                    }
                    label("HintDescription")
                    {
                        ApplicationArea = All;
                        Caption = 'Each scenario also provides a hint that leads you in the right direction for that scenario.';
                    }
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        TypeHelper: Codeunit "Type Helper";
    begin
        DescriptionTxt := 'Each scenario listed below contains a "bad implementation" that leads to poor performance.' + TypeHelper.NewLine();
        DescriptionTxt += 'What you should do:' + TypeHelper.NewLine();
        DescriptionTxt += '    1. Run a scenario - and observe that it''s pretty slow.' + TypeHelper.NewLine();
        DescriptionTxt += '    2. Use available troubleshooting tools to find out why the scenario is slow.'
    end;

    var
        PerfToolsTxt: Label 'How to Work with a Performance Problem';
        DescriptionTxt: Text;
        PerfToolsUrlTxt: Label 'https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/performance/performance-work-perf-problem#which-tools-are-good-when';
}