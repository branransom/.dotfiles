#!/bin/bash

dot-fetch() {
    echo "Fetching and checking out all submodules"

    dotfiles submodule update --init --recursive
}

dot-update() {
    echo "Updating all submodules"

    dotfiles submodule update --remote
}

dot-rm() {
    echo "Removing submodule $1"

    dotfiles submodule deinit "$1"
    dotfiles rm "$1"
}
