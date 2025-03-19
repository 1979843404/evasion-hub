# 0x01 跳过WAF
寻找真实ip，直接通过ip访问，或者修改本地hosts文件

# 0x02 利用WAF缺陷
## 01 垃圾数据
软waf出于兼容一些性能不高的机器，对于超大数据包会跳过不检测
## 02 高并发
高并发场景下WAF处理不过来，导致某些请求被放行

# 0x03 利用WAF适配后端组件缺陷
## 01 IIS
## 02 Tomcat
https://y4tacker.github.io/2022/06/19/year/2022/6/探寻Tomcat文件上传流量层面绕waf新姿势/
## 03 编码绕过
utf-16、cp037、unicode

# 0x04 利用WAF适配协议缺陷
## 01 修改请求方法或请求头
将http请求方法改为waf不能识别的方法
```
请求方法改为随机字符串

请求方法后加入tab等空字符

get方法带上post体（需要服务端支持）
```
## 02 分块传输
http://github.com/c0ny1/chunked-coding-converter

# 0x05 利用WAF白名单缺陷
https://github.com/TheKingOfDuck/burpFakeIP

# 0x06 利用XFF头绕过WAF
```
案例：伪造XFF为目标单位外网IP来绕过龙御的云WAF
```

# 0x07 瑞数WAF绕过
```
https://github.com/wjlin0/riverPass
https://github.com/R0A1NG/Botgate_bypass
```

# 工具
```
https://github.com/leveryd/x-waf
```

# 参考链接
https://forum.butian.net/share/3639【HW 中如何利用 WAF 缺陷进行绕过】