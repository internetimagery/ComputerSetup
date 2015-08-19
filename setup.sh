# Install things

# Update packages
sudo apt-get update
sudo apt-get upgrade

# Install multimedia
sudo apt-get install -y vlc audacity

# Install graphics programs
sudo apt-get install -y gimp gimp-plugin-registry krita blender scribus

# Install Utility
sudo apt-get install -y keepassx dropbox

# Install assorted
sudo apt-get install skype

# Install development
sudo apt-get install gcc g++ alien git python ntfs-3g

# Install custom mouse setup packages
sudo apt-get install -y xbindkeys

# Install Kodi
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:team-xbmc/ppa
sudo apt-get update
sudo apt-get install kodi

# Create folder for non-package downloads
export DownloadDIR=$HOME/temp_download
if [ ! -d $DownloadDIR ]; then
  mkdir $DownloadDIR
fi

# Install ATOM editor
export ATOM=$DownloadDIR/atom.deb
if [ ! -f $ATOM ]; then
  echo "Downloading Atom"
  wget https://atom.io/download/deb -O $ATOM
fi
sudo dpkg -i $ATOM
