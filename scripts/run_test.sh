#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# echo "dir:  >>> $DIR"

# CURRENT=`pwd`
CURRENT="$(dirname "$DIR")"


projectPath="${CURRENT}"

    echo "                         "
    echo "========================="
    echo "$projectPath"
    echo "========================="
    echo "                         "

function project_test {
    path=$1
    echo "                         "
    echo "========================="
    echo "$path"
    echo "========================="
    echo "                         "

    cd "${path}"

    flutter test

}

project_test  "${projectPath}/packages/app_config"
project_test  "${projectPath}/packages/app_models"
