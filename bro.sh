pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

yay -S bspwm polybar sxhkd eww dunst rofi lsd jq checkupdates-aur \
playerctl mpd ncmpcpp mpc picom-arian8j2-git xtitle termite betterlockscreen \
ttf-jetbrains-mono nerd-fonts-jetbrains-mono ttf-terminus-nerd ttf-inconsolata \
ttf-joypixels nerd-fonts-cozette-ttf scientifica-font \
feh maim pamixer libwebp webp-pixbuf-loader xorg-xkill papirus-icon-theme

git clone --depth=1 https://github.com/gh0stzk/dotfiles.git

# ⚠️ Backuupp!! your filess!!!
[ -e ~/.config/bspwm ] && mv ~/.config/bspwm ~/.config/bspwm-backup-"$(date +%Y.%m.%d-%H.%M.%S)"
[ -e ~/.config/termite ] && mv ~/.config/termite ~/.config/termite-backup-"$(date +%Y.%m.%d-%H.%M.%S)"

# Moving new files to .config
cd dotfiles
cp -r config/bspwm ~/.config/bspwm
cp -r config/termite ~/.config/termite
# Those were the important ones. You still need to move the remaining directories in config to your ~/.config directory.

# Move Fonts and the other stuff
cp -r misc/fonts/* ~/.local/share/fonts/
cp -r misc/bin ~/.local/
cp -r misc/applications ~/.local/share/
cp -r misc/asciiart ~/.local/share/
fc-cache -rv

# You probably MUST use your own .zsh config, but if you want to use mine, do;
cp -r home/.zshrc ~/.zshrc
cp -r config/zsh ~/.config/zsh

# If you will not use my zsh config, just add to your .zshrc file, this;
if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

# For automatically launching mpd on login
systemctl --user enable mpd.service
systemctl --user start mpd.service