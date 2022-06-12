#!/bin/sh
# to Fix common misspellings in text files
pip install codespell
# install prettier javascript and html css etc..
sudo npm install -g prettier_d_slim
# for rust
rustup component add rustfmt
# for scala
brew install coursier/formulas/coursier
coursier install scalafm
# or for arch
yay -S scalafmt-native-bin
