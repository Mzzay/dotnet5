# variables
FILE=dotnet-install.sh
URL=https://dot.net/v1/dotnet-install.sh

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
NC='\033[0m' # No Color

INSTALLATION_PATH="/usr/share/dotnet"

# checking curl installation
if ! command -v curl &> /dev/null
then
    echo -e "${ORANGE}Curl isn't installed... trying to download it...${NC}"
    if command -v apt &> /dev/null
    then
        # installation with apt
        sudo apt install curl
    elif command -v pacman &> /dev/null
    then
        # install with pacman
        sudo pacman -S curl
    else
        echo -e "${RED}You must install curl."
        exit
    fi
fi

echo -e "${GREEN}Curl verification/installation process finish."
echo -e "${GREEN}Downloading $FILE from $URL..."
echo -e "${NC}"
curl -L $URL > $FILE

echo -e "${GREEN}Make $FILE as executable file..."
sudo chmod +x $FILE

echo -e "Installation.."
sudo ./$FILE --install-dir $INSTALLATION_PATH -channel Current -version 5.0.100

echo -e "Removing file..."
rm ./$FILE

# install add global path
add_global_path=0
read -p "Trying to add global path ? [Y/n] " yn
case $yn in
    [Yy]* ) add_global_path=1; break;;
    [Nn]* ) add_global_path=0; break;;
    * ) add_global_path=1;;
esac

# environment
ENVFILE=""
case $SHELL in
    */zsh) 
        # append path
        ENVFILE="zshrc" ;;
    */bash)
        ENVFILE="bashrc" ;;
    *) 
esac

if [ $add_global_path -eq 1 ]
then
    if [[ "$ENVFILE" != "" ]]
    then
        echo -n 'export PATH=/usr/share/dotnet:$PATH' >> ~/.$ENVFILE
        echo -e "${GREEN}$INSTALLATION_PATH has been add to path."
    else
        echo -e "${ORANGE}Didn't found any compatible shell. Please add this global path to your environment: $INSTALLATION_PATH"
    fi
fi

echo -e "${GREEN}Dotnet 5 has been successfuly installed !"