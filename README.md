# .dotfiles

Mac config and setup steps.

![](https://cl.ly/pibU/Image%202018-02-22%20at%2010.12.26%20pm.png)

## First steps

[Install](http://osxdaily.com/2014/02/12/install-command-line-tools-mac-os-x/) command line developer tools:

```
make
```

Clone dotfiles to home directory

```
git clone https://github.com/jdkschang/dotfiles.git
```

## Install

Run install script:

```
./install.sh
```

Set macOS defaults:

```
./scripts/macos.sh
```

When complete, open new terminal window to trigger `zgen` plugin downloads.

## Credit
[junegunn](https://github.com/junegunn/dotfiles)
[dkarter](https://github.com/dkarter/dotfiles)
[jackfranklin](https://github.com/jackfranklin/dotfiles)
[simonsmith](https://github.com/simonsmith/dotfiles)

