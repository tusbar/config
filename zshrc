#! /usr/bin/env zsh

zsh_cache=${HOME}/.zsh_cache
mkdir -p $zsh_cache

setopt extended_glob

for zshrc_snipplet in ~/.zsh.d/S[0-9][0-9]*[^~] ; do
    source $zshrc_snipplet
done
