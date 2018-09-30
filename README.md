# SS-Panel for BT-Panel

## 环境要求

* Pure CentOS 6 / CentOS 7 (32 bit / 64 bit) System

* Greater than 256M Memory

## 安装说明

1. 安装 BT-Panel

   ```
   yum install -y wget && wget -O install.sh http://download.bt.cn/install/install.sh && sh install.sh
   ```

2. 安装网站环境

   * 建议使用 LNMP，并保证 PHP 版本在 7.0 以上，以获得更高的运行效率

3. 新建站点

4. 在配置文件中找到 `root /home/wwwroot/domain.com;`，并在你的域名后添加 `/public`

   * 例如：`root /home/wwwroot/domain.com/public`

5. 添加伪静态规则

   ```nginx
            location / {
               try_files $uri $uri/ /index.php$is_args$args;
           }  
   ```

6. 执行 SSH 指令

   ```
   cd /www/wwwroot/domain.com
   git clone https://github.com/yanranxiaoxi/SPFBP.git tmp && mv tmp/.git . && rm -rf tmp && git reset --hard
   cp config/.config.php.example config/.config.php
   chown -R root:root *
   chmod -R 755 *
   chown -R www:www storage
   chattr -i .user.ini
   mv .user.ini ./public
   cd ./public
   chattr +i .user.ini
   ```

7. 在 BT-Panel 中重启站点

8. 增加计划任务

   * 每日过期数据整理（Shell 脚本 | 每日执行）

      ```
      php /www/wwwroot/domain.com/xcat dailyjob
      ```

   * 每分钟过期数据检查（Shell 脚本 | 每分钟执行）

      ```
      php /www/wwwroot/domain.com/xcat checkjob
      ```

9. 新建并导入数据库

   * 导入数据库文件：[sspanel.sql](https://raw.githubusercontent.com/yanranxiaoxi/SPFBP/master/sql/sspanel.sql)

10. 配置 config/.config.php

   ```php
   # 修改为随机字符串
   $System_Config['key'] = 'randomkey';
   
   # 站点名称
   $System_Config['appName'] = 'SPFBP';
   
   # 站点地址
   $System_Config['baseUrl'] = 'https://domain.com';
   
   # 节点验权密匙（搭建节点时使用）
   $System_Config['muKey'] = 'mupass';
   
   # 数据库名
   $System_Config['db_database'] = 'spfbp';
   
   # 数据库用户名
   $System_Config['db_username'] = 'root';
   
   # 数据库密码
   $System_Config['db_password'] = 'password';
   
   # 是否启用邮箱验证码（需要有可用的 SMTP 服务器）
   $System_Config['enable_email_verify']='true';
   
   # SMTP 发信部分
   $System_Config['smtp_host'] = 'smtp.domain.com';
   $System_Config['smtp_username'] = 'admin@domain.com';
   $System_Config['smtp_port'] = '465';
   $System_Config['smtp_name'] = 'admin@domain.com';
   $System_Config['smtp_sender'] = 'SPFBP 自动通知邮件';
   $System_Config['smtp_passsword'] = '';
   $System_Config['smtp_ssl'] = 'true';
   ```

11. 默认用户信息
   * 用户名：`admin@domain.local`
   * 密码：`,zChr=jwhrP!unMbO>ns4roSv3pj.3uo`

## 常见问题

### 页面返回错误 json 值

   1. PHP 配置修改 `display_errors` `关闭`
   
   2. PHP 性能调整 `运行模式` `静态`
   
   3. 重载 PHP 配置

## 其他

### 添加管理员

```
php xcat createAdmin
```

### 重置流量

```
php xcat resetTraffic
```

### 发送流量使用情况邮件

```
php xcat sendDiaryMail
```

### 下载客户端

```
php -n xcat initdownload
```

### 下载 IP 解析库

```
php xcat initQQWry
```