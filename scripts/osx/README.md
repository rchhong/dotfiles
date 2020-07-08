# Mac OS

![neofetch screenshot](/media/macos.png)

## Prerequesites

Run the following two commands before running the install script.
```
sudo softwareupdate -i -a
xcode-select --install
```
Among other things, XCode developer tools installs git, which is necessary for the installation script to work

## Install
Run the following command
```
bash -c "$(curl -s https://raw.githubusercontent.com/infernalhydra/dotfiles/master/install.sh)"