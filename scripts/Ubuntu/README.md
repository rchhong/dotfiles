# Ubuntu Linux

## Prerequesites
It is recommended to install vanilla GNOME to remove the Ubuntu branding 

```
sudo apt install gnome-session
# Fix greeter, pick option /usr/share/gnome-shell/theme/gnome-shell.css
sudo update-alternatives --config gdm3.css
```

Select lightdm as the greeter.

## Install
Run the following command in normal mode
```
bash -c "$(wget https://raw.githubusercontent.com/infernalhydra/dotfiles/master/install.sh -O -)"
```

## neofetch screenshot
![neofetch screenshot](/media/neofetch.png)

## Theme
Canta theme with numix circle icons will be installed

## App
<!-- TODO: Actually Finish this section -->