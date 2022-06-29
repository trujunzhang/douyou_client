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

function project_update {
    path=$1
    echo "                         "
    echo "========================="
    echo "$path"
    echo "========================="
    echo "                         "

    cd "${path}"

    rm -f "${path}/pubspec.lock"
    flutter pub upgrade --major-versions 
}

project_update  "${projectPath}/app"
project_update  "${projectPath}/doc_widget_app"

project_update  "${projectPath}/packages/app_config"
project_update  "${projectPath}/packages/app_language"
project_update  "${projectPath}/packages/app_models"
project_update  "${projectPath}/packages/app_rest"
project_update  "${projectPath}/packages/app_widgets"
project_update  "${projectPath}/packages/app_theme"
