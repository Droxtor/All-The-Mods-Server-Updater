#!/usr/bin/env bash
unzip "$1"
cd "${1%.*}"
java -jar neoforge-*-installer.jar --installServer
cd ..
echo "Renaming Current-Server to Current-Server.old.$(date -I)"
mv Current-Server "Current-Server.old.$(date -I)"
echo "Renaming ${1%.*} to Current-Server"
mv "${1%.*}" Current-Server
echo "Copying world etc from old server"
cp -r Current-Server.old."$(date -I)"/{banned-ips.json,banned-players.json,eula.txt,journeymap,local,logs,ops.json,>
# This is for copying some config files from old server to updated server
#echo "Copying config changes to new server"
#cp Current-Server.old."$(date -I)"/config/{ftbessentials.snbt,quarryplus.toml} Current-Server/config/
echo "Copying simplebackups to new server"
cp Current-Server.old."$(date -I)"/mods/SimpleBackups-*.jar Current-Server/mods/
echo "Removing archive $1"
rm "$1"
