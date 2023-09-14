#!/bin/bash

if [ -z "$1" ]; then
  echo "Error: deviceId is not defined."
  exit 1
fi

deviceId="$1"

versions=("com.rn068" "com.rn069" "com.rn070" "com.rn071" "com.rn072" "com.rnnightly")

for appId in "${versions[@]}"
do
  echo "Testing $appId"
  flashlight test --bundleId $appId \
   --iterationCount 3 \
   --testCommand "maestro --device $deviceId test -e APP_ID=$appId e2e.yaml" \
   --duration 11000 \
   --resultsTitle $appId \
   --resultsFilePath $appId.json

   adb -s $deviceId shell am force-stop $appId
   sleep 0.2
done

version_report_files=$(printf " %s.json" "${versions[@]}")
flashlight report$version_report_files
