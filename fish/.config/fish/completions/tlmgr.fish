# Known commands
set -l tlmgr_commands update info candidates install remove search option

# Disable file completion
complete -c tlmgr -f

complete -f -c tlmgr -l version -d 'Show version information'

# Command completions
complete -f -c tlmgr -n "not __fish_seen_subcommand_from $tlmgr_commands" -a update -d 'Updates the packages given'
complete -f -c tlmgr -n '__fish_seen_subcommand_from update' -l all -d 'Update all installed packages except tlmgr itself'
complete -f -c tlmgr -n '__fish_seen_subcommand_from update' -l list -d 'Report what would be updated without actually updating anything'
complete -f -c tlmgr -n '__fish_seen_subcommand_from update' -l self -d 'Update tlmgr itself'

complete -f -c tlmgr -n "not __fish_seen_subcommand_from $tlmgr_commands" -a info -d 'Lists information about package pkg'
complete -f -c tlmgr -n '__fish_seen_subcommand_from info' -l only-installed -d 'Only locally installed packages, collections, or schemes listed'
complete -f -c tlmgr -n '__fish_seen_subcommand_from info' -l only-remote -d 'Only list pakcages from remove repository'

complete -f -c tlmgr -n "not __fish_seen_subcommand_from $tlmgr_commands" -a candidates -d 'Shows the available candidate repositories for package pkg'

complete -f -c tlmgr -n "not __fish_seen_subcommand_from $tlmgr_commands" -a install -d 'Install each pkg given on the command line'
complete -f -c tlmgr -n '__fish_seen_subcommand_from install' -l file -d 'Use the package files given on the command line'
complete -f -c tlmgr -n '__fish_seen_subcommand_from install' -l reinstall -d 'Reinstall a package (including dependencies for collections) even if it already seems to be installed'

complete -f -c tlmgr -n "not __fish_seen_subcommand_from $tlmgr_commands" -a remove -d 'Remove each pkg specified'
complete -f -c tlmgr -n '__fish_seen_subcommand_from remove' -l all -d 'Removes all of TexLive'

complete -f -c tlmgr -n "not __fish_seen_subcommand_from $tlmgr_commands" -a search -d 'Search all locally installed packages for the argument what'
complete -f -c tlmgr -n '__fish_seen_subcommand_from search' -l all -d 'Search everything: package names, descriptions and filenames'
complete -f -c tlmgr -n '__fish_seen_subcommand_from search' -l global -d 'Search the TeX Live Database of the installation medium, instead of the local installation'

complete -f -c tlmgr -n "not __fish_seen_subcommand_from $tlmgr_commands" -a option -d 'Modifies behavior of tlmgr'
complete -f -c tlmgr -n '__fish_seen_subcommand_from option' -a "repository" -d 'Modifies default package repository'