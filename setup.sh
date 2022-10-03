#setup.sh VNC_USER_PASSWORD VNC_PASSWORD NGROK_AUTH_TOKEN

#disable spotlight indexing
sudo mdutil -i off -a

#Create new account
sudo dscl . -create /Users/akhil
sudo dscl . -create /Users/akhil UserShell /bin/bash
sudo dscl . -create /Users/akhil RealName "Akhil"
sudo dscl . -create /Users/akhil UniqueID 1001
sudo dscl . -create /Users/akhil PrimaryGroupID 80
sudo dscl . -create /Users/akhil NFSHomeDirectory /Users/vncuser
sudo dscl . -passwd /Users/akhil $1
sudo dscl . -passwd /Users/akhil $1
sudo createhomedir -c -u akhil > /dev/null

#Enable VNC
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -configure -allowAccessFor -allUsers -privs -all
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -configure -clientopts -setvnclegacy -vnclegacy yes 

#VNC password - http://hints.macworld.com/article.php?story=20071103011608872
echo $2 | perl -we 'BEGIN { @k = unpack "C*", pack "H*", "1734516E8BA8C5E2FF1C39567390ADCA"}; $_ = <>; chomp; s/^(.{8}).*/$1/; @p = unpack "C*", $_; foreach (@k) { printf "%02X", $_ ^ (shift @p || 0) }; print "\n"' | sudo tee /Library/Preferences/com.apple.VNCSettings.txt

#Start VNC/reset changes
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -restart -agent -console
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate

#install ngrok
brew install --cask ngrok
#install chrome
brew install --cask google-chrome
#install Chrome-remote-desktop
brew install --cask chrome-remote-desktop-host
#install microsoft-remote-desktop(optional)
#brew install --cask microsoft-remote-desktop
#team-viewer (test)
brew install --cask teamviewer
#Anydesk
brew install --cask anydesk

##
##sudo /Applications/AnyDesk.app/Contents/MacOS/AnyDesk --get-id



#configure ngrok and start it
ngrok authtoken $3
ngrok tcp 5900 --region=in &
