function brew-upgrade-greedy --description "Upgrade all Homebrew packages preserving Dock layout"
    defaults export com.apple.dock /tmp/dock-layout.plist
    $HOMEBREW_PREFIX/bin/brew upgrade --greedy
    defaults import com.apple.dock /tmp/dock-layout.plist
    killall Dock
end
