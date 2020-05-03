Import-Module BitsTransfer;Clear-Host;

    Clear-Host;
    write-host '';
    write-host '=][= Angron did nothing wrong. =][=';
    write-host '';
    write-host 'Please subscribe to the following collection and watch the following';write-host 'videos before asking any questions:';
    write-host 'Collection: http://tiny.cc/TTSMods';
    write-host 'Videos: http://tiny.cc/TTSVids';
    write-host '';write-host 'Downloading the Battleforged Workshop Mod Compilation...';
    $currentGlobalPreference = $global:ProgressPreference;
    $global:ProgressPreference = 'Continue';
    $url='https://github.com/TTSWarhammer40k/Battleforged-Workshop-Mod-Compilation/raw/master/battleforged_workshop_mod_compilation.zip';
    $downloadTemp =  [System.Environment]::GetEnvironmentVariable('TEMP','Machine')+'\Battleforged-Workshop-Mod-Compilation.zip';
    $extractTemp =  [System.Environment]::GetEnvironmentVariable('TEMP','Machine')+'\TEMPSAVELOCATIONPLZIGNORE';
    $extractTemp2 =  [System.Environment]::GetEnvironmentVariable('TEMP','Machine')+'\TEMPSAVELOCATIONPLZIGNORE\Saves';
    $url2='https://github.com/TTSWarhammer40k/Battleforged-Workshop-Mod-Compilation-Updater/raw/master/Battleforged_Workshop_Mod_Compilation_Updater_(Just_Double_Click_Me).bat';
    $downloadTemp2 =  [System.Environment]::GetEnvironmentVariable('TEMP','Machine')+'\Battleforged_Workshop_Mod_Compilation_Updater_(Just_Double_Click_Me).bat';
    New-Item -ItemType 'directory' -Path $extractTemp -force | Out-Null;
    Remove-Item $extractTemp -Recurse -Force;
    Start-BitsTransfer -Source $url2 -Destination $downloadTemp2 -Priority Foreground;
    Start-BitsTransfer -Source $url -Destination $downloadTemp -Priority Foreground;
    $currentDirectory = (Get-Item -Path '.\').FullName;
    Copy-Item $downloadTemp2 -Destination $currentDirectory;
    $pathtosaves = [environment]::getfolderpath('mydocuments')+'\My Games\Tabletop Simulator';
    Microsoft.PowerShell.Archive\expand-archive -force -path $downloadTemp -destinationpath $extractTemp;
    Copy-Item -Path $extractTemp2 -Destination $pathtosaves -Recurse -Force;
    if($? -eq $false){
        write-host 'Something went wrong, please try again. If this error persists please download and manually inst
        all The Battleforged Workshop Mod Compilation from https://github.com/TTSWarhammer40k/Battleforged-Workshop-Mod-Compilation'
    }else{
        write-host 'The Battleforged Workshop Mod Compilation should now be successfully installed! Open Tabletop S
        imulator and check your Save games via the red Save/Load panel. If it does not show up, try running the script as
        Administrator. If that fails, please install it manually by going to https://github.com/TTSWarhammer40k/Battleforged-Workshop-Mod-Compilation.'
    }
$global:ProgressPreference = $currentGlobalPreference;
write-host 'Press any key to exit...';[void][System.Console]::ReadKey($true);