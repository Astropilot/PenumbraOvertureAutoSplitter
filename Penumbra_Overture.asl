//---------------------------------------------------------------------------
//  About: Load Remover & Auto Splitter
//  Author: MagicALCN, Astropilot, Kotti, PsychoManiac
//  Version: 1.2
//  Last Release Date: 11 March 2021
//  Repository: https://github.com/Astropilot/PenumbraOvertureAutoSplitter
//---------------------------------------------------------------------------


state("penumbra", "1.0")
{
    // mpScene->mpGraphics->mpRenderer3D->mRenderSettings->mAmbientColor->r : float
    int      ambient_color : 0x24EE7C, 0x20, 0x18, 0x8;

    // gpInit->mpMapHandler->msCurrentMap : String
    string32 current_map   : 0x240F54, 0x14C, 0xD8, 0x0;

    // gpInit->mpPlayer->mbActive : boolean
    byte     player_active : 0x240F54, 0x154, 0x1C8;

    // Do not exist on this version. Only present to detect version 1.1 of the game
    string4  game_version  : 0x242DE0;

    // gpInit->mpMapHandler->mfGameTime : double
    double   game_time     : 0x240F54, 0x14C, 0x20;
}

state("penumbra", "Steam 1.1")
{
    // mpScene->mpGraphics->mpRenderer3D->mRenderSettings->mAmbientColor->r : float
    int      ambient_color : 0x2AC46C, 0x20, 0x18, 0xB0;

    // gpInit->mpMapHandler->msCurrentMap : String
    string32 current_map   : 0x29DE94, 0x184, 0xD8, 0x0;

    // gpInit->mpPlayer->mbActive : boolean
    byte     player_active : 0x29DE94, 0x18C, 0x1E4;

    // Text ressources -> Game revision : String
    string4  game_version  : 0x242DE0;

    // gpInit->mpMapHandler->mfGameTime : double
    double   game_time     : 0x29DE94, 0x184, 0x20;
}

init
{
    /*
    Special note: The time given by the variable game_time is not directly usable because it is only an
    incrementing variable for the current map. Its value changes when you change the map (load a save for example)
    and is therefore not representative of the game time since the beginning of a game. So we only use it to
    increase an internal timer because it pauses during menu returns and loading times.
    */
    vars.ingame_time = TimeSpan.FromSeconds(0.0);

    if (current.game_version == "3013") {
        version = "Steam 1.1";
    } else {
        version = "1.0";
    }
}

start
{
    if(old.current_map != current.current_map && current.current_map == "level00_01_boat_cabin") {
        vars.ingame_time = TimeSpan.FromSeconds(0.0);
        return true;
    }

    return false;
}

reset
{
    return (old.current_map != current.current_map && current.current_map == "level00_01_boat_cabin");
}

split
{
    if(current.current_map != "" && old.current_map != "" && current.current_map != old.current_map) {
        return true;
    }

    if(current.current_map == "level01_20_base_entrance" && old.player_active == 1 && current.player_active == 0) {
        return true;
    }

    return false;
}

update
{
    /*
    ambient_color is used to detect the end of loading a map and avoid jumps in game_time
    values during loading that would otherwise be added to the internal timer.
    The ambient color is set to 0 during loading, otherwise it is in the range ]0; 1].
    */
    if (current.ambient_color > 0) {
        var incremental_time = TimeSpan.FromSeconds(current.game_time) - TimeSpan.FromSeconds(old.game_time);

        // It prevents the addition of a negative value (can happen while loading a save on some maps)
        if (incremental_time.Ticks > 0) {
            vars.ingame_time += incremental_time;
        }
    }
}

gameTime
{
    return vars.ingame_time;
}

isLoading
{
    // Prevents the use of the LiveSplit timer to use ingame time
    return true;
}
