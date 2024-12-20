# dotfiles
dotfiles

## Mac system preferences
### Keyboard
Switch Control to Caps lock  
Keyboard - Modifier Keys - Select keyboard: Internal keyboard / trackpad  
한/A key: ^ Control  
^ Control: 한/A key  
FC660C와 HHKB는 딥스위치로 설정한다.

Press global to Do Nothing  
Use F1, F2, etc as standard function keys [Yes]

### Shortcuts
Input Sources
- Select the previous input source: cmd + space
Mission Control
- Move left a space: ctrl + shift + Q
-	Move right a space: ctrl + shift + E
-	Switch to Desktop 1: ctrl + shift + 1
-	Switch to Desktop 2: ctrl + shift + 2
-	Switch to Desktop 3: ctrl + shift + 3

Keyboard
- Move focus to next window: cmd + ` (back quote)
Spotlight
- Show Spotlight search: ctrl + opt + cmd + space

### Input Sources
Use 한/A Key to switch to and from ABC [No]

### Accessibility
Display
	Reduce motion [Yes]

## Packages to install
### Prerequisite
- brew
- node
- Xcode command line tool

### Packages
1. install homebrew with following command(from official docs)
`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

2. [neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)
`brew install neovim`

3. [vim-plug](https://github.com/junegunn/vim-plug)
`sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`
4. [lf(list files)](https://github.com/gokcehan/lf)
5. [fzf](https://github.com/junegunn/fzf)
6. [zsh-autocomplete](https://github.com/marlonrichert/zsh-autocomplete)
7. htop
8. tmux
9. tmuxinator

Install using oh-my-zsh package(zsh plugin)
1. [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md)
2. [zsh syntax highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

- jq
- bat
- ripgrep
- fd


## Configs
- zsh: `~/.zshrc`
- wezterm: `~/.wezterm.lua`
- hammerspoon: `~/.hammerspoon/`
- neovim: `~/nvim/init.vim` or `~/.config/nvim/init.vim`
- Alfred: 

## Hammerspoon
- Change window size: ctrl + opt + arrow 
- Change window quarter size: ctrl + opt + U I J K
- Change window to full size: ctrl + opt + return
- Brightness control: ctrl + f1(decrease) / f2(increase)
- Media control: ctrl + f8(prev) / f9(play_pause) / f10(next)
- Volumn control: ctrl + f11(decrease) / f12(increase)
- Reload hammerspoon: opt + shift + r
- (todo): move desktop
- (todo): back / forward in logitech mouse for Safari

## Alfred
- wz: Open Wezterm
- ss: Search Swift doc
- sc: Search CPP doc
- nm: Search naver map
- gm: Search google map

## Applications
- Wezterm 
- Alfred
- HammerSpoon
- Workflowy
- Fork
- nPlayer
- Forklift3

## Browser Extensions
- Adblock
- Vimium
- Session Buddy
- Deepl
- PIP


