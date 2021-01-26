adb wait-for-device
adb root
adb wait-for-device
adb shell setenforce 0
adb wait-for-device
adb remount
adb wait-for-device
adb push app_dump.sh /system/bin/
adb push busybox /system/bin/
adb shell sync
adb wait-for-device
adb shell chmod a+x /system/bin/cm01_dump.sh
adb shell chmod a+x /system/bin/busybox
adb shell sync
adb wait-for-device
exit