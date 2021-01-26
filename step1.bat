adb wait-for-device
adb root
adb wait-for-device
adb shell setenforce 0
adb wait-for-device
adb disable-verity
adb wait-for-device
adb reboot
exit