## Contents

- [Contents](#contents)
- [Installation](#installation)
- [Remember](#remember)
- [Important Dependencies](#important-dependencies)
- [Enable Snap](#enable-snap)
- [Snap Packages](#snap-packages)
- [Manual AUR Packages](#manual-aur-packages)
- [Rofi Theme](#rofi-theme)
- [Ulauncher Theme](#ulauncher-theme)
- [Dotly](#dotly)
- [Sdkman](#sdkman)
- [Fix QT Theme](#fix-qt-theme)
- [nwgbar-icons](#nwgbar-icons)
- [Vlang (optional)](#vlang-optional)
- [Sddm (optional)](#sddm-optional)
- [Wifi Drivers (optional)](#wifi-drivers-optional)

## Installation
```bash
git clone https://github.com/LR56c/garuda-hyprland-pc-config.git && \
cp -r /garuda-hyprland-pc-config/* ~/.config
```

## Remember
- setup qt and gtk theme +font
- setup ulauncher theme
- [wallpapers drive](https://drive.google.com/drive/folders/1ZyZNp6Md5Gx8ghSbyd6rbU-kC3SYT3gc?usp=sharing)
- [Discord manual](https://discord.com/api/download?platform=linux&format=tar.gz) 
  - [BetterDiscord](https://betterdiscord.app/) 
  - file: `/home/lr56c/.local/share/applications/discord.desktop`
    - add: `Exec=/<discord_path>/Discord`

## Important Dependencies
```bash
sudo chmod +x ~/.config/deps_install.sh
```
```bash
sudo sh ~/.config/deps_install.sh
```

## Enable Snap
```bash
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
```

## Snap Packages
```bash
sudo snap install nvim --classic
```
```bash
sudo snap install flutter --classic
```

## Manual AUR Packages
```bash
anyrun-git
```
```bash
exercism-bin
```
```bash
hyprland-autoname-workspaces-git
```
```bash
hyprpicker
```
```bash
rofi-file-browser-extended-git
```
```bash
snapd
```
```bash
textsnatcher
```
```bash
pyprland
```
```bash
appimagelauncher
```
```bash
emote
```
```bash
pieces-os
```
```bash
pieces-for-developers
```

## Rofi Theme
```bash
git clone https://github.com/lr-tech/rofi-themes-collection.git && \
cd rofi-themes-collection && \
mkdir -p ~/.local/share/rofi/themes/ && \
cp themes/spotlight-dark.rasi  ~/.local/share/rofi/themes/
```

## Ulauncher Theme
```bash
mkdir -p ~/.config/ulauncher/user-themes && \
git clone https://github.com/Raayib/WhiteSur-Dark-ulauncher.git \
  ~/.config/ulauncher/user-themes/WhiteSur-Dark-ulauncher
```

## Dotly
```bash
bash <(curl -s https://raw.githubusercontent.com/CodelyTV/dotly/HEAD/installer)
```

## Sdkman
```bash
curl -s "https://get.sdkman.io" | bash source "$HOME/.sdkman/bin/sdkman-init.sh"
```

## Fix QT Theme
file: `/etc/environment`
```bash
QT_QPA_PLATFORMTHEME=qt5ct
```

## nwgbar-icons
```bash
sudo sh ~/.config/custom-themes/catpuccin/nwgbar-icons/install.sh
```

## Vlang (optional)
```bash
git clone https://github.com/vlang/v && \
cd v && \
make
```

## Sddm (optional)
```bash
sudo cp -r ~/.config/custom-themes/sddm/sober /usr/share/sddm/themes/
```
- file: `/usr/lib/sddm/sddm.conf.d/sddm.conf` or `/etc/sddm.conf`
```bash
[Theme]
Current=sober
```

## Wifi Drivers (optional)
```bash
mkdir drivers && \
 cd drivers && \
 git clone https://github.com/aircrack-ng/rtl8812au.git && \
 cd rtl8812au && \
 sudo make dkms_install
```