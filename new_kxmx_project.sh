#!/bin/bash

# Get the directory name from the user
read -p "Enter the directory/project name: " DIR_NAME
PROJECT_PATH=~/workspace/"$DIR_NAME"

# Create the new directory
mkdir -p "$PROJECT_PATH"

# Change into the new directory
cd "$PROJECT_PATH" || exit 1

# Initialize a git repository in this directory
/opt/homebrew/bin/git init
# /opt/homebrew/bin/git add .
# /opt/homebrew/bin/git commit -m "Initial commit"
# echo "Created new directory and initialized git repo."

# Define an array of submodule repositories to pull
# SUBMODULES=("https://github.com/recursinging/kxmx_bluemchen.git")

# Loop through the submodules and pull them in
# for submodule in "${SUBMODULES[@]}"; do
#   echo "Pulling $submodule submodule..."
#   /opt/homebrew/bin/git submodule add $submodule
# done

# Init submodules recursively
# /opt/homebrew/bin/git submodule update --init --recursive
# /opt/homebrew/bin/git add .
# /opt/homebrew/bin/git commit -m "Add submodules and init them recursively."
# echo "Submodules added and initialized."

/usr/bin/touch "$DIR_NAME.cpp"
echo "Main C++ file created with name $DIR_NAME.cpp."

echo "# Project Name" >> Makefile
echo "TARGET ?= ${DIR_NAME}" >> Makefile
echo "" >> Makefile
echo "DEBUG = 1" >> Makefile
echo "OPT = -O0" >> Makefile
echo "" >> Makefile
echo "# Sources" >> Makefile
echo "CPP_SOURCES = \${TARGET}.cpp" >> Makefile
echo "BLUEMCHEN_DIR = ./kxmx_bluemchen" >> Makefile
echo "CPP_SOURCES += \$(BLUEMCHEN_DIR)/src/kxmx_bluemchen.cpp" >> Makefile
echo "" >> Makefile
echo "USE_FATFS = 1" >> Makefile
echo "" >> Makefile
echo "# Library Locations" >> Makefile
echo "LIBDAISY_DIR = \$(BLUEMCHEN_DIR)/libDaisy" >> Makefile
echo "DAISYSP_DIR = \$(BLUEMCHEN_DIR)/DaisySP" >> Makefile
echo "" >> Makefile
echo "# Core location, and generic Makefile." >> Makefile
echo "SYSTEM_FILES_DIR = \$(LIBDAISY_DIR)/core" >> Makefile
echo "include \$(SYSTEM_FILES_DIR)/Makefile" >> Makefile
echo "" >> Makefile
echo "# copied from grntlr Makefile" >> Makefile
echo "CFLAGS += -Os" >> Makefile
echo "C_DEFS += -DTARGET_BLUEMCHEN" >> Makefile
echo "C_INCLUDES += -I\$(BLUEMCHEN_DIR)/src" >> Makefile

echo "Makefile generated"

cp -r ./.vscode "$PROJECT_PATH"

echo "VSCode tasks created"

echo "All done! Git repo with submodules created."
