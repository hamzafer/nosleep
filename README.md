# nosleep

Keep your Mac awake, even with the lid closed. One click in the menu bar.

😴 normal sleep

💀 staying awake

## Install

```
brew install --cask swiftbar
./install.sh
```

[SwiftBar](https://github.com/swiftbar/SwiftBar) shows the icon in the menu bar. The installer asks for your password once.

## Use

Click the icon: **Stay awake**, a **1, 2, 4 or 8 hour** timer, or **Cancel timer**.

Or in the terminal:

```
nosleep on [--for HOURS]
nosleep off
nosleep status
```

Turns itself off when the battery drops below 20%.

⚠️ A closed Mac that never sleeps can get hot in a bag. Use a timer.

## Uninstall

```
./uninstall.sh
```

MIT license.
