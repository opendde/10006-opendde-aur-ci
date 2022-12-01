#!/usr/bin/env bash

set -x
# set -Eeu


export CMD_PATH=$(cd `dirname $0`; pwd)
export PROJECT_NAME="${CMD_PATH##*/}"

cd $CMD_PATH


rsync -avP ./ ~/9329/ > /dev/null


chown -R runner:runner ~/9329/
cd ~/9329/
ls -al 

buildaur(){
    rm -rf /var/cache/pacman/pkg/
    sudo -u runner git clone --depth=1 -b $1 "https://github.com/opendde/10006-opendde-aur-ci.git" "tmp_${1}"
    cd "tmp_${1}"
    sudo -u runner makepkg --log --nocolor -s --nosign --noconfirm -f 
    cd ..
    rm -rf "tmp_${1}"
    rm -rf /var/cache/pacman/pkg/
}

cd aur-all/$1

for pkg in `ls`
do
    buildaur $pkg
done
