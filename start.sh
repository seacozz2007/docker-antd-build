#!/bin/sh
#########################################################################
# File Name: start.sh
# Author: Eric_zhang
# Email:  84089842@qq.net
# Version:
# Created Time: 2017/4/3
#########################################################################

DATA_DIR=/data/www

set -e

    if [ -z "$BRANCH" ]; then
            echo >&2 'error:  missing BRANCH'
            echo >&2 '  Did you forget to add -e BRANCH=... ?'
            exit 1
    fi

    if [ -z "$DIST_DIR" ]; then
         echo >&2 'error:  missing DIST_DIR'
         echo >&2 '  Did you forget to add -e DIST_DIR=... ?'
         exit 1
     fi

     deploy_path="/tmp/community-backend"
     project_path="git@git.famesmart.com:Jully/community-backend.git -b "$BRANCH

     if [  -d "$deploy_path" ]; then
        rm -rf $deploy_path
     fi
    git clone $project_path $deploy_path
    cd $deploy_path
    cnpm  i 
    cnpm install jsonp
    npm run lint
    cp -r dist $DATA_DIR$DIST_DIR



