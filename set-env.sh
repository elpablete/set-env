#!/bin/sh

## Usage:
##   . ./set-env.sh
##   . ./set-env.sh dev.env

unamestr=$(uname)
${1:=.env}
if [ "$unamestr" = 'Linux' ]; then

  export $(grep -v '^#' ${1} | xargs -d '\n')

elif [ "$unamestr" = 'FreeBSD' ] || [ "$unamestr" = 'Darwin' ]; then

  export $(grep -v '^#' ${1} | xargs -0)

fi

