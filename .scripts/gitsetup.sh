#!/bin/bash

git config --global pull.rebase false
git config --global user.name "fady0"
git config --global user.email "fadinagh0@gmail.com"
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=31536000'
git config --global core.editor nvim
git config --global color.ui true