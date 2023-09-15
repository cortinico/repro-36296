# Reproducer for [#36296](https://github.com/facebook/react-native/issues/36296)

This is a reproducer for [react-native#36296](https://github.com/facebook/react-native/issues/36296).
It contains several apps with both Hermes and JSC to run benchmarks and find regressions.

## Run Automated Tests

We use Flashlight and Maestro to quickly run tests against an Android device and
retrieve performance metrics such as FPS, CPU usage, and memory.

Steps:

1. [Install Flashlight](https://docs.flashlight.dev/)
2. [Install Maestro](https://maestro.mobile.dev/getting-started/installing-maestro)
3. Get your device ID (adb devices)
4. Run script `./test.sh <DEVICE_ID>`

