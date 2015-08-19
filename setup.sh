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
sudo apt-get install gcc g++ alien git python ntfs-3g pylint coffeescript
sh ./Nodejs/node-install.sh

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
cd $DownloadDIR

# Install ATOM editor
export ATOM=$DownloadDIR/atom.deb
if [ ! -f $ATOM ]; then
  echo "Downloading Atom"
  wget https://atom.io/download/deb -O $ATOM
fi
sudo dpkg -i $ATOM

# Install NodeJs
if [ ! -f node.html ]; then
  wget https://nodejs.org/dist/latest/ -O node.html
fi
export NodeVersion=$(cat node.html | grep -o -E 'href="(node-v.*-linux-x64.tar.gz)"' | cut -d'"' -f2 | sort | uniq)
if [ ! -f $NodeVersion ]; then
  wget https://nodejs.org/dist/latest/$NodeVersion -O $NodeVersion
fi
cd /usr/local && sudo tar --strip-components 1 -xzvf $DownloadDIR/$NodeVersion
cd $DownloadDIR
