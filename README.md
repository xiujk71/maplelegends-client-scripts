# Script for unofficial MapleLegends Client

To set it up follow steps below:
- Clone this repo locally
  - Note: ./ is used to represent the repo's base folder
- Setup dxvk dlls:
  - Download dxvk-1.10.3.tar.gz
    - Link: https://github.com/doitsujin/dxvk/releases/tag/v1.10.3
  - Extract the content to ./dll_files/
  - Check that the folder ./dll_files/dxvk-1.10.3/ exist
- Setup wine appimage
  - Download wine appimage'
    - Example used here is wine-stable_9.0-x86_64.AppImage, but you can use any modern version
    - Link: https://github.com/mmtrt/WINE_AppImage/releases/tag/continuous-stable
    - Place wine-stable_9.0-x86_64.AppImage in ./ and rename it to wine.AppImage
- Setup MapleLegends
  - Download Crossover version of MapleLegends (MAC):
    - Link: https://forum.maplelegends.com/index.php?threads/new-macos-installation-guide-faq.38764/
  - Extract the MapleLegends files
    - In the archive, MapleLegends files are located in MapleLegendsMAC<Release_Date>/drive_c/MapleLegends
    - Extract the folder to ./
    - Check that ./MapleLegends/MapleLegends.exe exist
- Enable executable permissions for these 3 files:
  - ./maplelegends.sh
  - ./ml_winecfg.sh
  - ./wine.AppImage
- Run maplelegends by running ./maplelegends.sh on terminal

Some things to note:
- ./maplelegends.sh creates the wine prefix in ~/maplelegends_prefix.
- if you need to use winecfg for any reason, you can run ./ml_winecfg.sh
- please run ./maplelegends.sh before ./ml_winecfg.
  - ./maplelegends checks if the prefix exist or not and uses that condition to install dxvk-1.10.3, ws2_32.dll & ws2help.dll
- dxvk-1.10.3 can be installed via winetricks dxvk1103, but manual installation is done via script in the event of winetricks not working for unknown reasons.
- for some reason, manually applying dxvk dll overwrites breaks, and prevents MapleLegends from running. Hence that portion is being commented

Acknowledgements:
- https://www.winehq.org
- https://github.com/mmtrt/WINE_AppImage
- https://github.com/doitsujin/dxvk/
