#!/bin/env bash

run_gulp() {
    node --inspect=0.0.0.0:9229 ./node_modules/.bin/gulp dev
}

run_nuxt() {
    if npx nuxt dev -h | grep -wq 'hostname'; then
        HOSTNAME_CMD='hostname'
    else
        HOSTNAME_CMD='host'
    fi

    node --inspect=0.0.0.0:9229 ./node_modules/.bin/nuxt dev --${HOSTNAME_CMD} 0.0.0.0 --port 3000
}


if [ -d node_modules ];then
    if [ -f gulpfile.js ]; then
        run_gulp
    else
        run_nuxt
    fi
fi 
