# variables
FILE=dotnet-install.sh
URL=https://dot.net/v1/dotnet-install.sh

echo "Downloading $FILE from $URL"
curl -L https://dot.net/v1/dotnet-install.sh > dotnet-install.sh

echo "According right"
chmod +x dotnet-install.sh

echo "Installation.."
./dotnet-install.sh --install-dir /usr/share/dotnet -channel Current -version 5.0.100 