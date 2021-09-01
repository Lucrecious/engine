#!/bin/bash
set -e
echo "About to start Godot Build"
cd godot
scons -j8 platform=x11 custom_modules=../modules

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	echo "Linux detected."
	echo "Move to /local/bin/"
	sudo cp ./bin/godot.x11.tools.64 /usr/local/bin/godot
else
	echo "Unknown OS. Will not update."
fi
