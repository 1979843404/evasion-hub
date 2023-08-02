关闭控制台窗口的2种实现方式
```
#pragma comment(linker, "/subsystem:\"windows\" /entry:\"mainCRTStartup\"")  //不显示窗口

ShowWindow(GetForegroundWindow(), SW_HIDE);  //不显示窗口
```

Windows数据类型参考
```
https://learn.microsoft.com/zh-cn/windows/win32/winprog/windows-data-types
```