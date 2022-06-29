#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# echo "dir:  >>> $DIR"

# CURRENT=`pwd`
CURRENT="$(dirname "$DIR")"


projectPath="${CURRENT}"
# if [ ! -f  "${CURRENT}/pubspec.lock" ]; then
#     projectPath="$(dirname "${CURRENT}")"
# fi    


echo "[current]: ${CURRENT}"
echo "[projectPath]: ${projectPath}"

## ========================
## Language
## ========================
appLanguagePath="${projectPath}/packages/app_language"
cd "${appLanguagePath}"
# flutter packages get
# flutter pub run intl_utils:generate

## ========================
## Rest Api
## ========================
appRestPath="${projectPath}/packages/app_rest"
cd "${appRestPath}"
flutter packages get
flutter pub run build_runner build --delete-conflicting-outputs

## ========================
## app_models 
## ========================
appModelsPath="${projectPath}/packages/app_models"
cd "${appModelsPath}"
# flutter packages get
# flutter packages pub run build_runner build --delete-conflicting-outputs

## ========================
## app_widgets
## ========================
appWidgetsPath="${projectPath}/packages/app_widgets"
cd "${appWidgetsPath}"
# flutter packages get
# flutter pub run build_runner build  --delete-conflicting-outputs

