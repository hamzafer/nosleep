#!/bin/bash
set -euo pipefail

plugin_dir=$(defaults read com.ameba.SwiftBar PluginDirectory 2>/dev/null || echo "$HOME/.config/swiftbar/plugins")

"$HOME/.local/bin/nosleep" cancel 2>/dev/null || true
sudo /usr/bin/pmset -a disablesleep 0
sudo rm -f /etc/sudoers.d/nosleep
rm -f "$HOME/.local/bin/nosleep" "$plugin_dir/nosleep.10s.sh"
rm -rf "$HOME/.local/state/nosleep"
open -g "swiftbar://refreshallplugins" 2>/dev/null || true
echo "Removed."
