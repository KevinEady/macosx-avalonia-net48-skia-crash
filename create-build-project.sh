#!/bin/bash

rm -rf MyApp &&
dotnet new avalonia.mvvm -o MyApp &&
cd MyApp &&
sed -i 's@<TargetFramework>netcoreapp3.0</TargetFramework>@<TargetFrameworks>netcoreapp3.1;net48</TargetFrameworks>@; s/Version="0.9.9"/Version="0.10.0-preview2"/' MyApp.csproj &&
sed -i 's/using Avalonia.Logging.Serilog/using Avalonia.Logging/' Program.cs &&
msbuild -t:restore -v:m &&
msbuild -p:Configuration=Debug -v:m &&
cd bin/Debug/net48 &&
cp ../netcoreapp3.1/runtimes/osx/native/libAvaloniaNative.dylib . &&
mono MyApp.exe

