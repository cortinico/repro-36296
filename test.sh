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
   --testCommand "maestro --device $deviceId test -e APP_ID=$appId e2e.yaml" \
   --iterationCount 10 \
   --duration 11000 \
   --resultsTitle $appId \
   --resultsFilePath $appId.json

   adb -s $deviceId shell am force-stop $appId
   adb -s $deviceId shell pm clear $appId
   sleep 0.2
done

version_report_files=$(printf " %s.json" "${versions[@]}")
flashlight report$version_report_files
