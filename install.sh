#!/bin/bash/
#######################################
# Bash script to install apps on a new system (Arch Linux)
# Written by @Fadynagh from http://fadyio.com
# Email:me@fadyio.com
#######################################
##TODO: write the script to install all your programs
## Update packages and Upgrade system
sudo apt-get update -y

## Git ##
echo '###Installing Git..'
sudo apt-get install git -y

# Git Configuration
echo '###Configure Git..'

echo "Enter the Global Username for Git:"
read GITUSER
git config --global user.name "${GITUSER}"

echo "Enter the Global Email for Git:"
read GITEMAIL
git config --global user.email "${GITEMAIL}"

echo 'Git has been configured!'
git config --list

## s3cmd ##
echo '###Installing s3cmd..'
#Import S3tools signing key:
wget -O- -q http://s3tools.org/repo/deb-all/stable/s3tools.key | sudo apt-key add -
# Add the repo to sources.list:
sudo wget -O/etc/apt/sources.list.d/s3tools.list http://s3tools.org/repo/deb-all/stable/s3tools.list
# Refresh package cache and install the newest s3cmd:
sudo apt-get update && sudo apt-get install s3cmd

#s3cmd Configuration
echo '###Configure s3cmd..'
sudo s3cmd --configure
