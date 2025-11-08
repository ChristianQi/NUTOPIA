#!/bin/zsh
set -e
cd ~/NUTOPIA_Site/tree
zsh ./generate_tree_json.zsh
sudo rsync -av --delete ~/NUTOPIA_Site/tree/ /Library/WebServer/Documents/nutopia/tree/
cd ~/NUTOPIA_Site
git add tree/tree.json tree/generate_tree_json.zsh
git commit -m "Update directory tree" || true
git pull --rebase origin main || true
git push origin main
