# dotfiles
My Tmux and Neovim configuration files

## Installation
* Clone the repository
```bash
git clone https://github.com/ZKAW/dotfiles && cd dotfiles
```
* Install required dependencies
```bash
sudo apt install -y tmux vim ripgrep stow &&
sudo snap install nvim --classic &&
mkdir -p tmux/.tmux/plugins/tpm &&
git clone https://github.com/tmux-plugins/tpm tmux/.tmux/plugins/tpm
```

## Setup
* Backup and remove your current configuration files
```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.tmux.conf ~/.tmux.conf.bak
mv ~/.tmux ~/.tmux.bak
mv ~/clangd ~/.clangd.bak
```

* Use GNU stow to symlink all the dotfiles
```bash
stow */
```

* You can also use specific dotfile
```bash
stow tmux
```
or 
```bash
stow nvim
```
or 
```bash
stow clangd
```

## Unstow
* To remove the symlinks
```bash
stow -D */
```

