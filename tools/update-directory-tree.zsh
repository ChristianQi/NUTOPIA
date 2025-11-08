#!/bin/zsh
set -e
cd ~/QUIN/AIA/NUTOPIA/tree
zsh ./generate_tree_json.zsh
sudo rsync -av --delete ~/QUIN/AIA/NUTOPIA/tree/ /Library/WebServer/Documents/nutopia/tree/
cd ~/QUIN/AIA/NUTOPIA
git add tree/tree.json tree/generate_tree_json.zsh
git commit -m "Update directory tree" || true
git pull --rebase origin main || true
git push origin main
