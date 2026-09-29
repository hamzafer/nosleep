#!/bin/bash
# <swiftbar.hideAbout>true</swiftbar.hideAbout>
# <swiftbar.hideRunInTerminal>true</swiftbar.hideRunInTerminal>
# <swiftbar.hideLastUpdated>true</swiftbar.hideLastUpdated>
# <swiftbar.hideDisablePlugin>true</swiftbar.hideDisablePlugin>
# <swiftbar.hideSwiftBar>true</swiftbar.hideSwiftBar>
NS="$HOME/.local/bin/nosleep"
"$NS" tick
state=$("$NS" status)
left=$("$NS" remaining)
fmt() { local s=$1; printf '%dh%02d' $((s/3600)) $(((s%3600)/60)); }
if [ "$state" = awake ]; then
  title="💀"; [ -n "$left" ] && title="💀 $(fmt "$left")"
else
  title="😴"
fi
echo "$title"
echo "---"
if [ "$state" = awake ]; then
  echo "Sleep disabled (awake, lid closed OK)"
  [ -n "$left" ] && echo "Reverts in $(fmt "$left")"
  echo "Allow sleep | bash=$NS param1=off terminal=false refresh=true"
else
  echo "Normal sleep"
  echo "Stay awake (until turned off) | bash=$NS param1=on terminal=false refresh=true"
fi
echo "---"
for h in 1 2 4 8; do
  echo "Timer: ${h}h | bash=$NS param1=on param2=--for param3=$h terminal=false refresh=true"
done
[ -n "$left" ] && echo "Cancel timer | bash=$NS param1=cancel terminal=false refresh=true"
echo "---"
b=$(/usr/bin/pmset -g batt | head -1 | sed -E "s/.*'(.*)'.*/\1/")
pct=$("$NS" batt)
echo "Battery: ${pct:-n/a}% (${b}) | color=gray"
