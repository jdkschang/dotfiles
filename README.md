# dotfiles

<p align="center">
  <a href="https://xkcd.com/1319/">
    <img src="https://imgs.xkcd.com/comics/automation.png" />
  </a>
</p>

## System info
* browser: `Firefox`
* editor: `Emacs`
* os: `macOS`
* shell: `Fish`
* terminal editor: `Neovim`
* terminal font: `IBM Plex Mono`
* terminal: `iTerm2`
* window manager: `chunkwm`

## Installation
Set `DOTFILES` to whatever you want.
Make sure the enviroment variables `$XDG_CONFIG_HOME` and `$XDG_DATA_HOME` are
set.

### Dependencies
* git
* Go (required for installation)
* Dotbro (installed with install.sh, is used to symlink files)
``` shell
export DOTFILES="${HOME}/etc"
git clone git://github.com/Brettm12345/dotfiles "$DOTFILES"
eval "$DOTFILES"/install.sh
```

## Credit
[Brettm12345](https://github.com/Brettm12345/dotfiles)
[ar1a](https://github.com/ar1a/dotfiles)
[hlissner](https://github.com/hlissner/doom-emacs-private)
[dkarter](https://github.com/dkarter/dotfiles)
[jackfranklin](https://github.com/jackfranklin/dotfiles)
[simonsmith](https://github.com/simonsmith/dotfiles)
