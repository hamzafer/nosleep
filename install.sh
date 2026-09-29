#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")"

user=$(id -un)
bin_dir="$HOME/.local/bin"
plugin_dir=$(defaults read com.ameba.SwiftBar PluginDirectory 2>/dev/null || echo "$HOME/.config/swiftbar/plugins")

mkdir -p "$bin_dir" "$plugin_dir"
install -m 0755 nosleep "$bin_dir/nosleep"
install -m 0755 swiftbar/nosleep.10s.sh "$plugin_dir/nosleep.10s.sh"

tmp=$(mktemp)
trap 'rm -f "$tmp"' EXIT
echo "$user ALL=(root) NOPASSWD: /usr/bin/pmset -a disablesleep 0, /usr/bin/pmset -a disablesleep 1" > "$tmp"
visudo -cf "$tmp"
sudo install -m 0440 -o root -g wheel "$tmp" /etc/sudoers.d/nosleep

echo "Installed. Plugin dir: $plugin_dir"
echo "Make sure $bin_dir is on your PATH to use the CLI."
open -g "swiftbar://refreshallplugins" 2>/dev/null || true
