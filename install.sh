#!/bin/bash

post_install() {
    zenity --info --text="You must restart the PC and select the gnome environment in the login screen."
    zenity --info --text="This is not recommended. But if you want to remove Cinnamon then run the 'cleanup.sh' script."
}

SELECTION=$(zenity --list --title="Select Gnome Install" \
                   --column="Options" \
                   "Standard Gnome" "Minimal Gnome" \
                   --height=200 --width=300)

if [ $? -eq 0 ]; then
    case "$SELECTION" in
        "Standard Gnome")
            sudo apt install gnome
            post_install
            ;;
        "Minimal Gnome")
            sudo apt install vanilla-gnome-desktop
            post_install
            ;;
        *)
            echo "Invalid selection"
            ;;
    esac
else
    echo "No selection made."
fi
