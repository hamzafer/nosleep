# nosleep

A menu-bar toggle for `pmset disablesleep`. It keeps your Mac awake even with the lid closed.

## Why not caffeinate

`caffeinate` doesn't survive closing the lid. `pmset disablesleep` does.

## Install

Needs [SwiftBar](https://github.com/swiftbar/SwiftBar).

```
brew install --cask swiftbar
./install.sh
```

The installer asks for your password once, to write the sudoers rule.

## Usage

The menu bar shows 😴 for normal sleep and 💀 when sleep is disabled (with the time left if a timer is running). The menu has "Stay awake", timers for 1, 2, 4 and 8 hours, and "Cancel timer".

```
nosleep on            # stay awake until turned off
nosleep on --for 2    # stay awake for 2 hours (decimals work)
nosleep off
nosleep status        # prints awake or normal
nosleep cancel        # cancel the timer, stay awake
```

## How it works

- Runs `sudo pmset -a disablesleep 1` or `0`.
- The sudoers rule in `/etc/sudoers.d/nosleep` allows only those two exact commands, without a password.
- A timer runs `nosleep off` when it expires. The plugin also checks every 10 seconds, so a timer that outlives a reboot is cleaned up.
- On battery below 20%, the plugin restores normal sleep and sends a notification.

## Uninstall

```
./uninstall.sh
```

This restores `disablesleep 0` and removes everything the installer added.

## Safety

A closed Mac that never sleeps can get hot in a bag. Use a timer.

## License

MIT
