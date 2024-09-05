#!/bin/bash
dir_script=$(dirname $(realpath $0))
dir_ml=$dir_script/MapleLegends
dir_dll_files=$dir_script/dll_files
dir_prefix_system32=$HOME/maplelegends_prefix/drive_c/windows/system32

echo $dir_prefix_system32
if [[ -d "$dir_prefix_system32" ]]; then
    echo "maplelegends_prefix found"
    
else

    echo "maplelegends_prefix not found"

    echo "Creating maplelegends_prefix in $HOME/maplelegends_prefix"
    cd $dir_ml
    echo $(pwd)
    WINEPREFIX="$HOME/maplelegends_prefix" WINEARCH=win32 $dir_script/wine.AppImage wineboot
    echo "Success"

    echo "Updating ws2_32.dll and ws2help.dll "
    cd $dir_script
    cp "$dir_dll_files/ws2_32.dll" "$dir_prefix_system32/ws2_32.dll"
    cp "$dir_dll_files/ws2help.dll" "$dir_prefix_system32/ws2help.dll"
    echo "Success"

    echo "Copying dxvk-1.10.3 dlls"
    cp "$dir_dll_files/dxvk-1.10.3/x32/d3d9.dll" "$dir_prefix_system32/d3d9.dll"
    cp "$dir_dll_files/dxvk-1.10.3/x32/d3d10.dll" "$dir_prefix_system32/d3d10.dll"
    cp "$dir_dll_files/dxvk-1.10.3/x32/d3d10_1.dll" "$dir_prefix_system32/d3d10_1.dll"
    cp "$dir_dll_files/dxvk-1.10.3/x32/d3d10core.dll" "$dir_prefix_system32/d3d10core.dll"
    cp "$dir_dll_files/dxvk-1.10.3/x32/d3d11.dll" "$dir_prefix_system32/d3d9.dll"
    cp "$dir_dll_files/dxvk-1.10.3/x32/dxgi.dll" "$dir_prefix_system32/d3d11.dll"
    echo "Success"

    # applying overwrite breaks the runtime, unsure why
    # echo "Overwrite DLLs for dxvk-1.10.3"
    # WINEPREFIX="$HOME/maplelegends_prefix" WINEARCH=win32 $dir_script/wine.AppImage regedit $dir_dll_files/dxvk-1.10.3.reg
    # echo "Success"

    echo "Setting to Windows 98"
    WINEPREFIX="$HOME/maplelegends_prefix" WINEARCH=win32 $dir_script/wine.AppImage regedit $dir_dll_files/win98.reg
    echo "Success"

fi

echo "Starting MapleLegends"
cd "$dir_ml"
WINEPREFIX="$HOME/maplelegends_prefix" WINEARCH=win32 $dir_script/wine.AppImage ./MapleLegends.exe
