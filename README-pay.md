## 在线支付

1. 执行 SSH 指令

   ```
   cd /www/root/[domain.com]/public/assets/91pay
   cp 91pay.php.example 91pay.php
   ```

2. 注册 [码支付](https://codepay.fateqq.com/reg.html) 账号

3. 在 [码支付-系统设置](https://codepay.fateqq.com/admin/#/dataSet.html) 中获取你的 码支付ID 与 通信密钥

4. 填写通知地址

   ```
   https://[domain.com]/notify
   ```

5. 配置 91pay.php

   ```php
   //你的 码支付ID
   $codepay_config['id'] = '';
   //你的 通信密钥
   $codepay_config['key'] = '';
   ```

6. 在 [码支付-收款码上传](https://codepay.fateqq.com/admin/#/upQrcode.html?type=1) 上传收款二维码

7. 在 [码支付-收款码上传-批量上传](https://codepay.fateqq.com/admin/#/uploads.html?type=1) 上传带金额的收款二维码

   * 建议上传多张10元/20元/50元/100元的收款码

8. 配置 ../../../config/.config.php

   ```php
   # 修改为pay91
   $System_Config['payment_system']='pay91';
   ```

9. 在任意 Windows 系统安装 [码支付监控客户端](https://codepay.fateqq.com/down.html)

   * 请注意：码支付属于第三方平台，我方并不能保证其不做出包括但不限于侵犯用户财产之行为，请自行斟酌使用！
