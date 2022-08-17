; CrusadersGameDataSet class contains IC's CrusadersGameDataSet class structure. Useful for finding information in defines.

#include %A_LineFile%\..\IC_GameObjectStructure_Class.ahk

class IC_CrusadersGameDataSet32_Class ; static loc is ==  its instance loc
{
    __new()
    {
        this.Refresh()
    }
 
    GetVersion()
    {
        return "v1.1.8, 2022-07-29, IC v0.461.1+, 32-bit"  
    }

    Refresh()
    {
        this.Main := new _ClassMemory("ahk_exe IdleDragons.exe", "", hProcessCopy)
        this.BaseAddress := this.Main.getModuleBaseAddress("mono-2.0-bdwgc.dll")+0x003A4DE0 ; v461.1
        this.CrusadersGame := {}
        this.CrusadersGame.Defs := {}
        this.CrusadersGame.Defs.CrusadersGameDataSet := new GameObjectStructure( [0xEC, 0x38, 0x24, 0x50, 0xE80] ) ; v461.1
        this.CrusadersGame.Defs.CrusadersGameDataSet.BaseAddress := this.BaseAddress
        #include %A_LineFile%\..\Imports\IC_CrusadersGameDataSet32_Import.ahk
    }
}

class IC_CrusadersGameDataSet64_Class
{
    __new()
    {
        this.Refresh()
    }

    GetVersion()
    {
        return "v1.1.11, 2022-07-30, IC v0.462+, 64-bit"  
    }

    Refresh()
    {
        this.Main := new _ClassMemory("ahk_exe IdleDragons.exe", "", hProcessCopy)
        this.BaseAddress := this.Main.getModuleBaseAddress("mono-2.0-bdwgc.dll")+0x004A33B8 ; v462
        this.CrusadersGame := {}
        this.CrusadersGame.Defs := {}
        this.CrusadersGame.Defs.CrusadersGameDataSet := new GameObjectStructure( [0x210, 0xBE0] ) ; v462
        this.CrusadersGame.Defs.CrusadersGameDataSet.BaseAddress := this.BaseAddress
        this.CrusadersGame.Defs.CrusadersGameDataSet.Is64Bit := true
        #include %A_LineFile%\..\Imports\IC_CrusadersGameDataSet64_Import.ahk
    }
}