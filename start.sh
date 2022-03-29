# variables
FILE=dotnet-install.sh
URL=https://dot.net/v1/dotnet-install.sh
RED='\033[0;31m'
GREEN='\033[0;32m'

# checking curl installation
if ! command -v curl &> /dev/null
then
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

echo "Downloading $FILE from $URL"
curl -L $URL > $FILE

echo "According right"
sudo chmod +x $FILE

echo "Installation.."
sudo ./$FILE --install-dir /usr/share/dotnet -channel Current -version 5.0.100

echo "Removing file..."
rm ./$FILE

echo -e "${GREEN}Dotnet 5 has been successfuly installed !"