#!/bin/sh
#########################################################################
# File Name: start.sh
# Author: Eric_zhang
# Email:  84089842@qq.net
# Version:
# Created Time: 2017/4/3
#########################################################################

DATA_DIR=/data/www/community-backend

set -e

    if [ -z "$BRANCH" ]; then
            echo >&2 'warning:  missing BRANCH'
            echo >&2 '  Did you forget to add -e BRANCH=... (dev) ?'
            $BRANCH = dev
    fi



    git clone http://test:testfamesmart2017@git.famesmart.com/Jully/community-backend.git -b $BRANCH /var/community-backend

    cd /var/community-backend/admin
    cnpm  i 
    cnpm install jsonp
    npm run lint
    if [ -z "$DIST_DIR" ]; then
         echo >&2 'warning:  missing DIST_DIR'
         echo >&2 '  Did you forget to add -e DIST_DIR=... '
    else
        npm run build
        rm -rf $DATA_DIR$DIST_DIR
        cp -r dist $DATA_DIR$DIST_DIR
     fi

    
    
    


git clone http://test:testfamesmart2017@git.famesmart.com/Jully/community-backend.git -b eric.zhang /var/community-backend

