#!/bin/sh

#Remember to install and setup a cron job if you want your system to do this alone
#https://wiki.archlinux.org/title/cron#Crontab_format

USER_ID=1000
USER_NAME="mark"
#generate 4 random numbers
FILE="$RANDOM$RANDOM$RANDOM$RANDOM"
DIR="/home/$USER_NAME/Pictures/Profile"

echo "Setting up profile picture for $USER_NAME"

IMG_URL="https://avatars.dicebear.com/api/adventurer/$FILE.svg"

rm -r $DIR/*

echo "Downloading image file"

wget -q -P $DIR $IMG_URL

echo "Image file $FILE.svg downloaded"

busctl call \
    org.freedesktop.Accounts \
    /org/freedesktop/Accounts/User$USER_ID \
    org.freedesktop.Accounts.User \
    SetIconFile \
    s "$DIR/$FILE.svg"

echo "Profile picture set"
