#!/bin/bash
# Written by @Fadynagh from http://fadyio.com
# Email:me@fadyio.com
# Github: @fady0


git config --global pull.rebase false
git config --global user.name "fady0"
git config --global user.email "fadinagh0@gmail.com"
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=31536000'
git config --global core.editor nvim
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global interactive.diffFilter "diff-so-fancy --patch"
git config --global color.ui true

git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"

git config --global color.diff.meta       "11"
git config --global color.diff.frag       "magenta bold"
git config --global color.diff.func       "146 bold"
git config --global color.diff.commit     "yellow bold"
git config --global color.diff.old        "red bold"
git config --global color.diff.new        "green bold"
git config --global color.diff.whitespace "red reverse"
