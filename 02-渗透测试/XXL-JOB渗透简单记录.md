同事已经打完，给了我一个截图，我去验证一遍  

admin   123456进入后台  
定时任务执行命令，服务器不出网，通过调度日志查看执行结果  
怎么也验证不成功，一直如下错误：  

Cannot run program "bash": CreateProcess error=2, 系统找不到指定的文件。  

可同事给我的截图分明是linux系统啊  

抱着试试看的态度，选择了powershell，还真成了  
还真是一切皆有可能，猜测后端是集群，有的executor是linux，有的executor是windows  

参考文章：  
https://mp.weixin.qq.com/s/t0aDztXr9KNwop_Je5ot4Q  
https://mp.weixin.qq.com/s/vUr4kLQ88coHxxLbb-ZwxA  
https://mp.weixin.qq.com/s/AKufROJaT6DLDqyykslrAg  