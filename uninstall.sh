#!/bin/bash

PLUGIN_DIR="/usr/lib/budgie-desktop/plugins" 

# Pre-install checks
if [ $(id -u) = 0 ]
then
    echo "FAIL: Please run this script as your normal user (not using sudo)."
    exit 1
fi

if [ ! -d "$PLUGIN_DIR" ]
then
    echo "FAIL: The Budgie plugin directory does not exist: $PLUGIN_DIR"
    exit 1
fi

function fail() {
    echo "FAIL: Uninstallation failed. Please note any errors above."
    exit 1
}

# Actual uninstallation
echo "Uninstalling Workspace Switcher from $PLUGIN_DIR"

sudo rm -rf "${PLUGIN_DIR}/workspaces-compact-applet" || fail
budgie-panel --replace &

echo "Uninstall successful."
