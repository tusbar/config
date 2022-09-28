# Load homebrew’s environment variables
# This should be in .zshenv, but apple calls `path_helper` in /etc/zprofile,
# which would move all the homebrew PATHs to the end, and we do not want that.
eval "$(/opt/homebrew/bin/brew shellenv)"
