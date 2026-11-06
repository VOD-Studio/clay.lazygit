# clay.lazygit

[Clay](https://github.com/DefectingCat/clay.nvim) theme for [lazygit](https://github.com/jesseduffield/lazygit): grayscale layers with a single Clay accent on focus.

The theme ships both variants in one file. Lazygit asks the terminal for its background and applies `darkTheme` or `lightTheme`; a terminal that doesn't answer gets the dark variant. Requires lazygit 0.66+ (`gui.darkTheme`, `gui.lightTheme`) and a truecolor terminal.

## Install

Merge the theme into your own config, so updates to either file stay separate. With this repository checked out at `~/.local/share/clay.lazygit`:

```sh
export LG_CONFIG_FILE="$(lazygit --print-config-dir)/config.yml,$HOME/.local/share/clay.lazygit/themes/clay.yml"
```

Later files win, so keep `clay.yml` last. Alternatively, copy the `gui:` section of `themes/clay.yml` into `~/.config/lazygit/config.yml`.

To pin a variant regardless of the terminal, set it in your own config:

```yaml
gui:
  colorScheme: light # or dark
```

## Color roles

Colors come from `lua/clay/palette.lua` in clay.nvim and follow its [design system](https://github.com/DefectingCat/clay.nvim/blob/main/design/clay-design-system.md).

| lazygit field                     | Palette key    | Dark      | Light     |
| --------------------------------- | -------------- | --------- | --------- |
| `activeBorderColor`               | `clay`         | `#d97757` | `#d97757` |
| `searchingActiveBorderColor`      | `bright`       | `#e6e6e6` | `#202020` |
| `inactiveBorderColor`             | `float_border` | `#444444` | `#b5b5b5` |
| `optionsTextColor`                | `comment`      | `#7a7a7a` | `#737373` |
| `selectedLineBgColor`             | `selection`    | `#363636` | `#c6c6c6` |
| `inactiveViewSelectedLineBgColor` | `cursorline`   | `#1e1e1e` | `#e5e5e5` |
| `cherryPickedCommitFgColor`       | `bright`       | `#e6e6e6` | `#202020` |
| `cherryPickedCommitBgColor`       | `search`       | `#424242` | `#b7b7b7` |
| `markedBaseCommitFgColor`         | `bg`           | `#121212` | `#f6f6f6` |
| `markedBaseCommitBgColor`         | `secondary`    | `#aaaaaa` | `#4b4b4b` |
| `unstagedChangesColor`            | `secondary`    | `#aaaaaa` | `#4b4b4b` |
| `defaultFgColor`                  | `fg`           | `#cccccc` | `#333333` |
| `authorColors["*"]`               | `muted`        | `#8e8e8e` | `#616161` |

Both active borders are bold. `selectedLineFgColor` is `default`: the selected line keeps its text colors and is marked by its background alone.

## Terminal colors

Lazygit hardcodes ANSI colors for diffs, staged files, commit hashes, the commit graph, and status labels; no config field reaches them. They follow your terminal palette. For the full Clay look, set the terminal to the [Clay ANSI table](https://github.com/DefectingCat/clay.nvim/blob/main/design/clay-design-system.md#终端-ansi-16-色).

## Development

`themes/clay.yml` is generated; edit `scripts/build.lua` instead. Both targets read the palette from a sibling clay.nvim checkout unless `CLAY_PALETTE` points elsewhere.

```sh
make build  # regenerate themes/clay.yml
make check  # fail if the file is stale or related states share a color
```
