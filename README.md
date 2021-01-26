# app_proc_dump

描述：通过自定义脚本文件来周期性地记录app的运行状态。
通过脚本来记录app的运行情况，可以很好地解决由于内存、虚拟
内存、线程数量、文件句柄数量、堆栈溢出等一系列原因造成的app
Crash问题。
1. 相关状态
1）进程及线程情况 ps -A -T | grep -nri $pid
2）进程状态 cat /proc/$pid/status
3）进程的文件句柄情况 ls -l /proc/$pid/fd
4）进程的内存使用情况 dumpsys meminfo -a $pid
5）系统的内存使用情况 cat /proc/meminfo
2.脚本实现
1）需要busybox支持
2）需要root设备后拷入脚本文件
3.脚本运行
4.案例参考


相关步骤：
确保测试开关和调试模式已开启：

1、adb devices
可以识别到设备


2、执行step1.bat


3、执行step2.bat


4、脚本运行
4-1、root&关闭selinux
adb wait-for-device && adb root && adb wait-for-device && adb shell setenforce 0

4-2、执行脚本
adb shell
sh /system/bin/app_dump.sh packageName &


重要说明：
针对品牌手机，一般情况下，adb root命令是不能成功执行root操作的，如果是自研产品，理论上是可以的。
我司自己研发的产品，有其它root途径，需要可企业微信联系。
