
# Dotnet 5 linux installation

There is two solutions:

- You can start `start.sh` program. by using. 
```
chmod +x ./start.sh
```

- You can do it manually.
_Downloading dotnet-install.sh from https://dot.net/v1/dotnet-install.sh_

```
curl -L https://dot.net/v1/dotnet-install.sh > dotnet-install.sh
```

_According right_
```
chmod +x dotnet-install.sh
```

_Installation.._
```
./dotnet-install.sh --install-dir /usr/share/dotnet -channel Current -version 5.0.100 
```