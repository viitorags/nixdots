<div style="display: flex; align-items: center; justify-content: center;">
    <p style="margin: 0; padding: 0;">
        <img src="https://i.imgur.com/X5zKxvp.png" width="18" style="margin-right: 5px; position: relative; top: 4px;">My Config NixOs
    </p>
</div>


## Previews
![Preview1](./assets/previews/Screenshot%20from%202025-10-19%2019-48-47.png)
![Preview2](./assets/previews/Screenshot%20from%202025-10-19%2019-49-36.png)
![Preview3](./assets/previews/Screenshot%20from%202025-10-19%2020-01-28.png)

<details>
  <summary>SDDM</summary>
  <img src="./assets/previews/Screenshot from 2025-10-19 19-52-56.png"/>
</details>

## Packages
- **Window Manager** • [Niri](https://github.com/YaLTeR/niri/) Scrolleable WM!
- **Shell** • [ZSH](https://www.zsh.org/) with Oh-My-Zsh
- **Terminal** • [Wezterm](https://wezterm.org/index.html)
- **Panel** • [Noctalia](https://github.com/noctalia-dev/noctalia-shell)
- **File Manager** • [Yazi](https://github.com/sxyazi/yazi)
- **GUI Basic-IDE** • [VSCode](https://code.visualstudio.com/)
- **Text editor** • [Neovim](https://neovim.io/)

## Keybinds
> <strong>Note:</strong> $mainMod is set to the SUPER key (usually the Windows key).

| Shortcut          | Description                                   |
| ----------------- | --------------------------------------------- |
| $mainMod + Return | Opens the terminal (Wezterm)                  |
| $mainMod + Q      | Closes the active window                      |
| $mainMod + E      | Opens the file manager (Yazi)                 |
| $mainMod + T      | Toggles the window between floating and tiled |
| $mainMod + A      | Opens the launcher/menu (Noctalia)            |
| $mainMod + P      | Runs the custom power menu (Noctalia)         |
| $mainMod + B      | Opens the default browser (Brave)             |
| $mainMod + C      | Opens the default editor (Neovim)             |
| $mainMod + V      | Manages clipboard (Noctalia)                  |

## Requirements

- Git

## Quick Start

```bash
git clone https://github.com/viitorags/nixdots.git

cd nixdots

sudo nixos-rebuild switch --flake .#gh0stk
home-manager switch --flake .
```
