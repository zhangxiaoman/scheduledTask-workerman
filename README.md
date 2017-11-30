# scheduledTask-workerman

**基于workerman和yaf开发的计划任务系统。**
**web端管理计划任务，查看任务日志，异常报警。**
**如果计划任务很少，直接用linux的crontab即可。**

**功能列表:**

 1. yaf cli 命令行模式执行php程序（也支持curl模式）；
 2. web在线管理计划任务，主要功能
    1. 管理计划任务列表，
    2. 添加用户，
    3. 查看任务日志，
    4. 任务异常报警提醒；
 3. 使用workerman的定时器执行计划任务：
    1. 任务循环执行
    2. 只执行一次
    3. 每天执行一次三种魔术
    4. linux crontab 格式(支持到秒)

**目录结构**

```
├── README.md
├── cronCli         // YAF cli 模式
│   ├── README.md
│   ├── application
│   ├── config
│   └── request.php
├── cronWeb         // YAF web 
│   ├── application
│   ├── cache
│   ├── config
│   ├── index.php
│   └── public
├── cronWorker      // 利用 workerman timer 实现 cron
│   ├── Applications
│   ├── README.md
│   ├── Workerman
│   └── start.php
├── doc
│   ├── add-task.png
│   ├── alarm-log.png
│   ├── task-list.png
│   ├── user-manage.png
│   └── workerman-console.png
├── phpCli          // 普通 php 文件
│   └── User.php
└── timer.sql       // SQL.
```

## 实现思路

1. cronWeb 在启动/停止任务通过 socket 跟 cronWorker 通信, 告诉 cronWorker 新增/删除定时器.
2. cronWorker onMessage 接收 cronWeb 消息处理定时器
3. `Cron->execute` 判断任务的类型(phpcli, yafcli, curl) 通过不同方式执行
4. 执行完成判断任务结束时间, 删除定时器, 更改任务状态(web 端呈现任务状态)

## 解析 linux crontab 

**[ParseCrontab](https://github.com/zhangxiaoman/ParseCrontab)**


## cronCli 基于php yaf开发的php cli命令行程序
**示例程序:**

``` php
// 执行 User 控制器的 List 方法
php request.php request_uri="/user/list"

// result
{"code":1,"info":2}
```

## phpCli 普通模式php cli命令行程序
**示例程序:**
``` php
php User.php

// result
{"code":1,"info":{"uid":1024,"age":100,"username":"moxiaobai","realname":"莫小白"}}
```

## cronWeb 基于php yaf开发的web管理工具

**计划任务列表**
![image](https://github.com/zhangxiaoman/scheduledTask-workerman/blob/master/doc/task-list.png)

**添加计划任务**
![image](https://github.com/moxiaobai/scheduledTask-workerman/blob/master/doc/add-task.png)

**用户管理**
![image](https://github.com/moxiaobai/scheduledTask-workerman/blob/master/doc/user-manage.png)

**报警日志**
![image](https://github.com/moxiaobai/scheduledTask-workerman/blob/master/doc/alarm-log.png)

## cronWorker基于workerman开发的计划任务
**开启计划任务**
``` php
以后台服务的形式启动
php start.php start -d
```

**注意事项：**

- 需要修改php.ini， 找到disable_function,去除exec和stream_socket_server方法.
- 需要先启动 cronWorker, 否则 cronWeb 中启动任务跟 cronWorker 通信会失败.

![](https://github.com/moxiaobai/scheduledTask-workerman/blob/master/doc/workerman-console.png)



