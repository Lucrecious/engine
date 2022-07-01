#!/bin/bash
set -e
echo "About to start Godot Build"
cd godot

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	echo "Linux detected."
	scons -j8 platform=x11 custom_modules=../modules
	echo "Move to /usr/local/bin/"
	sudo cp ./bin/godot.x11.tools.64 /usr/local/bin/godot
elif [[ "$OSTYPE" == "darwin"* ]]; then
	echo "Mac detected."
	scons -j8 platform=osx custom_modules=../modules
	echo "Move to /usr/local/bin/"
	sudo cp ./bin/godot.osx.tools.64 /usr/local/bin/godot
else
	echo "Unknown OS. Will not update."
fi
