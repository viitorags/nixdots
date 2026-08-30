# wise-enter.yazi
Yazi plugin:  enter the deepest subfolder, extract archives, open files - all in `<Enter>` key

---

## Features

- **Tunnel skipping** — if a directory contains only a single subdirectory, it jumps straight to the deepest non-trivial level (e.g. `a/b/c/` → enters `c` directly)
- **Archive extraction** — extracts archives via `unar` and then navigates into the result, also skipping tunnels
- **Smart file opening** — opens regular files with `open`, with optional multi-select support via `open_multi`

## Requirements

- [Yazi](https://github.com/sxyazi/yazi)
- [`unar`](https://theunarchiver.com/command-line) (provided by the `unarchiver` package)

```bash
# Arch Linux
sudo pacman -S unarchiver

# macOS
brew install unar
```

## Installation

```bash
ya pkg add jaam8/wise-enter
```

Or manually clone into your Yazi plugins directory:

```bash
git clone https://github.com/jaam8/wise-enter.yazi.git ~/.config/yazi/plugins/wise-enter.yazi
```

## Usage

Add to `~/.config/yazi/keymap.toml`:

```toml
[[manager.keymap]]
on = "<Enter>"
run = "plugin wise-enter"
desc = "Wise enter"
```

Optionally configure in `~/.config/yazi/init.lua`:

```lua
require("wise-enter"):setup {
    open_multi = false, -- set to true to open all selected files instead of hovered only
}
```

## Behavior

| Hovered item | Action |
|---|---|
| Directory (no tunnel) | `enter` — navigate one level in |
| Directory (with tunnel) | `cd` — jump straight to the deepest non-empty directory |
| Archive | Extract via `unar`, then apply directory logic to the result |
| Regular file | `open` — respects `open_multi` option |

## Credits

Inspired by and built on top of:
- [smart-enter.yazi](https://github.com/yazi-rs/plugins/tree/main/smart-enter.yazi) — the original archive extraction + tunnel skipping idea
- [fast-enter.yazi](https://github.com/ourongxing/fast-enter.yazi) — the `open_multi` and `enter`/`open` toggle approach

## License

This plugin is MIT-licensed. For more information check the [LICENSE](LICENSE) file.
