# nosleep

Keep your Mac awake, even with the lid closed. One click in the menu bar.

😴 = normal sleep · 💀 = staying awake

## Why not caffeinate?

`caffeinate` stops working when you close the lid. `nosleep` uses `pmset disablesleep`, which keeps going.

## Quick start

Needs [SwiftBar](https://github.com/swiftbar/SwiftBar), a free app that shows scripts in the menu bar.

```
brew install --cask swiftbar
./install.sh
```

The installer asks for your password once. After that, nosleep never asks again.

## Using it

Click the menu-bar icon:

- **Stay awake** until you turn it off
- **1, 2, 4 or 8 hours**, then back to normal sleep
- **Cancel timer** (stays awake)

While a timer runs, the icon shows the time left.

Or use the terminal:

```
nosleep on            # stay awake until turned off
nosleep on --for 2    # stay awake for 2 hours (decimals work)
nosleep off           # back to normal sleep
nosleep status        # prints awake or normal
nosleep cancel        # cancel the timer, stay awake
```

## Built-in safety

- **Low battery:** below 20% on battery, nosleep turns itself off and tells you.
- **Timers survive reboots:** the menu bar checks every 10 seconds, so an expired timer always gets cleaned up.
- **Tight permissions:** the sudoers rule allows only `pmset -a disablesleep 1` and `0`, nothing else.

⚠️ A closed Mac that never sleeps can get hot in a bag. Use a timer.

## How it works

- Turning it on runs `sudo pmset -a disablesleep 1`. Turning it off runs the same with `0`.
- `/etc/sudoers.d/nosleep` lets those two exact commands run without a password.
- A timer is a background process that runs `nosleep off` when time is up.

## Uninstall

```
./uninstall.sh
```

Restores normal sleep and removes everything the installer added.

## License

MIT
