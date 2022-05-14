/*
    Extended memory reads
*/

g_TabControlHeight += 305
GuiControl, ICScriptHub:Move, ModronTabControl, % "w" . g_TabControlWidth . " h" . g_TabControlHeight
;Gui, show, % "w" . g_TabControlWidth+5 . " h" . g_TabControlHeight+40

Gui, ICScriptHub:Tab, Memory View
Gui, ICScriptHub:Font, w700
Gui, ICScriptHub:Add, Text, x15 y+15, Extended Memory Reads:
Gui, ICScriptHub:Font, w400

Gui, ICScriptHub:Add, Text, x15 y+5, ReadChampUpgradeCountByID: 
Gui, ICScriptHub:Add, Text, vReadChampUpgradeCountByIDID x+2 w300,
Gui, ICScriptHub:Add, Text, x15 y+5, ReadChampSeatByID: 
Gui, ICScriptHub:Add, Text, vReadChampSeatByIDID x+2 w300,
Gui, ICScriptHub:Add, Text, x15 y+5, ReadChampSlotByID: 
Gui, ICScriptHub:Add, Text, vReadChampSlotByIDID x+2 w300,
Gui, ICScriptHub:Add, Text, x15 y+5, ReadChampHealthByID: 
Gui, ICScriptHub:Add, Text, vReadChampHealthByIDID x+2 w300,
Gui, ICScriptHub:Add, Text, x15 y+5, GetFormationSaveBySlot: 
Gui, ICScriptHub:Add, Text, vGetFormationSaveBySlotID x+2 w300,
Gui, ICScriptHub:Add, Text, x15 y+5, ReadFormationNameBySlot: 
Gui, ICScriptHub:Add, Text, vReadFormationNameBySlotID x+2 w300,
Gui, ICScriptHub:Add, Text, x15 y+5, ReadMonstersSpawnedThisAreaOL: 
Gui, ICScriptHub:Add, Text, vReadMonstersSpawnedThisAreaOLID x+2 w300,
Gui, ICScriptHub:Add, Text, x15 y+5, ReadGameStarted: 
Gui, ICScriptHub:Add, Text, vReadGameStartedID x+2 w300,
Gui, ICScriptHub:Add, Text, x15 y+5, ReadFinishedOfflineProgressWindow: 
Gui, ICScriptHub:Add, Text, vReadFinishedOfflineProgressWindowID x+2 w300,
Gui, ICScriptHub:Add, Text, x15 y+5, ReadInGameNumSecondsToProcess: 
Gui, ICScriptHub:Add, Text, vReadInGameNumSecondsToProcess2ID x+2 w300,
Gui, ICScriptHub:Add, Text, x15 y+5, Steam: 
Gui, ICScriptHub:Add, Text, vIsSteam x+2 w300,
Gui, ICScriptHub:Add, Text, x15 y+5, ReadAutoProgressToggled: 
Gui, ICScriptHub:Add, Text, vReadAutoProgressToggledID x+2 w300,
Gui, ICScriptHub:Add, Text, x15 y+5, Gold_Combined: 
Gui, ICScriptHub:Add, Text, vReadGoldStringID x+2 w300,
Gui, ICScriptHub:Add, Text, x15 y+5, Gold_Combined2: 
Gui, ICScriptHub:Add, Text, vReadGoldString2ID x+2 w300,
Gui, ICScriptHub:Add, Text, x15 y+5, Gold_Combined3: 
Gui, ICScriptHub:Add, Text, vReadGoldString3ID x+2 w300,
Gui, ICScriptHub:Add, Text, x15 y+5, Formation in Favorite 1: 
Gui, ICScriptHub:Add, Text, vFormationInFavoriteOne x+2 w300,

class ReadMemoryFunctionsExtended
{
    CheckReads()
    {
        if(IsFunc(Func("ReadMemoryFunctions.MainReads")))
            ReadMemoryFunctions.MainReads()
        this.ExtendedReads()
    }

    ExtendedReads()
    {
        champID := 58
        GuiControl, ICScriptHub:, ReadChampUpgradeCountByIDID, % "ChampID: " . champID . ", Level: " . g_SF.Memory.ReadChampUpgradeCountByID(champID)
        GuiControl, ICScriptHub:, ReadChampSeatByIDID, % "ChampID: " . champID . ", Seat: " . g_SF.Memory.ReadChampSeatByID(champID)
        GuiControl, ICScriptHub:, ReadChampSlotByIDID, % "ChampID: " . champID . ", Slot: " . g_SF.Memory.ReadChampSlotByID(champID)
        GuiControl, ICScriptHub:, ReadChampHealthByIDID, % "ChampID: " . champID . ", Health: " . g_SF.Memory.ReadChampHealthByID(champID)
        GuiControl, ICScriptHub:, GetFormationSaveBySlotID, % "Slot: 0, Save: " . ArrFnc.GetDecFormattedArrayString(g_SF.Memory.GetFormationSaveBySlot(0))
        GuiControl, ICScriptHub:, ReadFormationNameBySlotID, % "Slot: 0, Name: " . g_SF.Memory.ReadFormationNameBySlot(0)
        GuiControl, ICScriptHub:, ReadMonstersSpawnedThisAreaOLID, % g_SF.Memory.ReadMonstersSpawnedThisAreaOL()
        GuiControl, ICScriptHub:, ReadGameStartedID, % g_SF.Memory.ReadGameStarted()
        GuiControl, ICScriptHub:, ReadFinishedOfflineProgressWindowID, % g_SF.Memory.ReadOfflineDone()
        GuiControl, ICScriptHub:, IsSteam, % !g_SF.Memory.GameManager.is64Bit()
        GuiControl, ICScriptHub:, ReadAutoProgressToggledID, % g_SF.Memory.ReadAutoProgressToggled()
        GuiControl, ICScriptHub:, ReadGoldStringID, % g_SF.Memory.ReadGoldString()
        GuiControl, ICScriptHub:, ReadGoldString2ID, % g_SF.Memory.ReadGoldString2()
        GuiControl, ICScriptHub:, ReadGoldString3ID, % g_SF.Memory.ReadGoldString3()
        GuiControl, ICScriptHub:, FormationInFavoriteOne, % ArrFnc.GetDecFormattedArrayString(g_SF.Memory.GetFormationByFavorite( 1 ))
        GuiControl, ICScriptHub:, ReadInGameNumSecondsToProcess2ID, % g_SF.Memory.ReadOfflineTime()
    }
}