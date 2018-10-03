SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- --------------------------------------------------------

--
-- 表的结构 `alive_ip`
--

CREATE TABLE IF NOT EXISTS `alive_ip` (
  `id` bigint(20) NOT NULL,
  `nodeid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `ip` text NOT NULL,
  `datetime` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `announcement`
--

CREATE TABLE IF NOT EXISTS `announcement` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `content` longtext NOT NULL,
  `markdown` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `auto`
--

CREATE TABLE IF NOT EXISTS `auto` (
  `id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `value` longtext NOT NULL,
  `sign` longtext NOT NULL,
  `datetime` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `blockip`
--

CREATE TABLE IF NOT EXISTS `blockip` (
  `id` bigint(20) NOT NULL,
  `nodeid` int(11) NOT NULL,
  `ip` text NOT NULL,
  `datetime` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bought`
--

CREATE TABLE IF NOT EXISTS `bought` (
  `id` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `shopid` bigint(20) NOT NULL,
  `datetime` bigint(20) NOT NULL,
  `renew` bigint(11) NOT NULL,
  `coupon` text NOT NULL,
  `price` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `code`
--

CREATE TABLE IF NOT EXISTS `code` (
  `id` bigint(20) NOT NULL,
  `code` varchar(128) NOT NULL UNIQUE,
  `type` int(11) NOT NULL,
  `number` decimal(11,2) NOT NULL,
  `isused` int(11) NOT NULL DEFAULT '0',
  `userid` bigint(20) NOT NULL,
  `usedatetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `coupon`
--

CREATE TABLE IF NOT EXISTS `coupon` (
  `id` bigint(20) NOT NULL,
  `code` text NOT NULL,
  `onetime` int(11) NOT NULL,
  `expire` bigint(20) NOT NULL,
  `shop` text NOT NULL,
  `credit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `detect_list`
--

CREATE TABLE IF NOT EXISTS `detect_list` (
  `id` bigint(20) NOT NULL,
  `name` longtext NOT NULL,
  `text` longtext NOT NULL,
  `regex` longtext NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;


--
-- 转存表中的数据 `detect_list`
--

INSERT INTO `detect_list` VALUES (1,'禁止 BT 下载','防止资源滥用及可能引起的版权争议','BitTorrent protocol',1),(2,'禁止 BT 下载','防止资源滥用及可能引起的版权争议','(ed2k|\\.torrent|peer_id=|announce|info_hash|get_peers|find_node|BitTorrent|announce_peer|announce\\.php\\?passkey=|magnet:|xunlei|sandai|Thunder|XLLiveUD|bt_key)',1),(3,'屏蔽百度定位','防止节点IP与客户端地理位置被记录','(api|ps|sv|offnavi|newvector|ulog\\.imap|newloc)(\\.map|)\\.(baidu|n\\.shifen)\\.com',1),(4,'禁止邮件滥发','防止代理服务被用于发送垃圾邮件','(Subject|HELO|SMTP)',1),(5,'屏蔽临时邮箱','防止代理服务被用于发送垃圾邮件','/^.*@(guerrillamail\\.(info|biz|com|de|net|org)|guerrillamailblock\\.com|sharklasers\\.com|grr\\.la|pokemail\\.net|spam4\\.me|(mail\\.)?bccto\\.me|chacuo\\.net|027168\\.com)$/i',1),(6,'屏蔽 360 服务','防止 360 主动屏蔽节点','(.+\\.|^)(360|so)\\.(cn|com)',1),(7,'屏蔽轮子网站','防止睿智用户手贱','(.*\\.||)(dafahao|minghui|dongtaiwang|epochtimes|ntdtv|falundafa|wujieliulan)\\.(org|com|net)',1),(8,'屏蔽網上行','防止睿智用户手贱','(.*\\.||)(netvigator)\\.(com|cn|net|org)',1),(9,'屏蔽 CCNIC 证书','屏蔽中国互联网络信息中心污染','(\\.|)cnnic\\.net\\.cn',1);


-- --------------------------------------------------------

--
-- 表的结构 `detect_log`
--

CREATE TABLE IF NOT EXISTS `detect_log` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `list_id` bigint(20) NOT NULL,
  `datetime` bigint(20) NOT NULL,
  `node_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `disconnect_ip`
--

CREATE TABLE IF NOT EXISTS `disconnect_ip` (
  `id` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `ip` text NOT NULL,
  `datetime` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `email_verify`
--

CREATE TABLE IF NOT EXISTS `email_verify` (
  `id` bigint(20) NOT NULL,
  `email` text NOT NULL,
  `ip` text NOT NULL,
  `code` text NOT NULL,
  `expire_in` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `link`
--

CREATE TABLE IF NOT EXISTS `link` (
  `id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `address` text NOT NULL,
  `port` int(11) NOT NULL,
  `token` text NOT NULL,
  `ios` int(11) NOT NULL DEFAULT '0',
  `userid` bigint(20) NOT NULL,
  `isp` text,
  `geo` int(11) DEFAULT NULL,
  `method` text
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- 表的结构 `login_ip`
--

CREATE TABLE IF NOT EXISTS `login_ip` (
  `id` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `ip` text NOT NULL,
  `datetime` bigint(20) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `payback`
--

CREATE TABLE IF NOT EXISTS `payback` (
  `id` bigint(20) NOT NULL,
  `total` decimal(12,2) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `ref_by` bigint(20) NOT NULL,
  `ref_get` decimal(12,2) NOT NULL,
  `datetime` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `paylist`
--

CREATE TABLE IF NOT EXISTS `paylist` (
  `id` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `total` decimal(12,2) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `tradeno` text,
  `datetime` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `radius_ban`
--

CREATE TABLE IF NOT EXISTS `radius_ban` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `relay`
--

CREATE TABLE IF NOT EXISTS `relay` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `source_node_id` bigint(20) NOT NULL,
  `dist_node_id` bigint(20) NOT NULL,
  `dist_ip` text NOT NULL,
  `port` int(11) NOT NULL,
  `priority` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `shop`
--

CREATE TABLE IF NOT EXISTS `shop` (
  `id` bigint(20) NOT NULL,
  `name` text NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `content` text NOT NULL,
  `auto_renew` int(11) NOT NULL,
  `auto_reset_bandwidth` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


--
-- 转存表中的数据 `shop`
--

INSERT INTO `shop` VALUES (1,'【其他】体验套餐',1.00,'{\"bandwidth\":\"1\",\"class\":\"2\",\"class_expire\":\"1\"}',0,0,1),(2,'【VIP1】月付',6.00,'{\"bandwidth\":\"10\",\"class\":\"1\",\"class_expire\":\"31\"}',30,0,1),(3,'【VIP1】季付',15.00,'{\"bandwidth\":\"35\",\"class\":\"1\",\"class_expire\":\"93\"}',90,0,1),(4,'【VIP1】半年付',30.00,'{\"bandwidth\":\"100\",\"class\":\"1\",\"class_expire\":\"186\"}',180,0,1),(5,'【VIP1】年付',50.00,'{\"bandwidth\":\"200\",\"class\":\"1\",\"class_expire\":\"372\"}',360,0,1),(6,'【VIP2】月付',10.00,'{\"bandwidth\":\"20\",\"class\":\"2\",\"class_expire\":\"31\"}',30,0,1),(7,'【VIP2】季付',28.00,'{\"bandwidth\":\"70\",\"class\":\"2\",\"class_expire\":\"93\"}',90,0,1),(8,'【VIP2】半年付',55.00,'{\"bandwidth\":\"180\",\"class\":\"2\",\"class_expire\":\"186\"}',180,0,1),(9,'【VIP2】年付',100.00,'{\"bandwidth\":\"500\",\"class\":\"2\",\"class_expire\":\"372\"}',360,0,1),(10,'【其他】100GB流量包',15.00,'{\"bandwidth\":\"100\"}',0,0,1),(11,'【其他】500GB流量包',50.00,'{\"bandwidth\":\"500\"}',0,0,1);


-- --------------------------------------------------------

--
-- 表的结构 `speedtest`
--

CREATE TABLE IF NOT EXISTS `speedtest` (
  `id` bigint(20) NOT NULL,
  `nodeid` int(11) NOT NULL,
  `datetime` bigint(20) NOT NULL,
  `telecomping` text NOT NULL,
  `telecomeupload` text NOT NULL,
  `telecomedownload` text NOT NULL,
  `unicomping` text NOT NULL,
  `unicomupload` text NOT NULL,
  `unicomdownload` text NOT NULL,
  `cmccping` text NOT NULL,
  `cmccupload` text NOT NULL,
  `cmccdownload` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ss_invite_code`
--

CREATE TABLE IF NOT EXISTS `ss_invite_code` (
  `id` int(11) NOT NULL,
  `code` varchar(128) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '2016-06-01 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ss_node`
--

CREATE TABLE IF NOT EXISTS `ss_node` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `type` int(3) NOT NULL,
  `server` varchar(128) NOT NULL,
  `method` varchar(64) NOT NULL,
  `info` varchar(128) NOT NULL,
  `status` varchar(128) NOT NULL,
  `sort` int(3) NOT NULL,
  `custom_method` tinyint(1) NOT NULL DEFAULT '0',
  `traffic_rate` float NOT NULL DEFAULT '1',
  `node_class` int(11) NOT NULL DEFAULT '0',
  `node_speedlimit` decimal(12,2) NOT NULL DEFAULT '0.00',
  `node_connector` int(11) NOT NULL DEFAULT '0',
  `node_bandwidth` bigint(20) NOT NULL DEFAULT '0',
  `node_bandwidth_limit` bigint(20) NOT NULL DEFAULT '0',
  `bandwidthlimit_resetday` int(11) NOT NULL DEFAULT '0',
  `node_heartbeat` bigint(20) NOT NULL DEFAULT '0',
  `node_ip` text,
  `node_group` int(11) NOT NULL DEFAULT '0',
  `custom_rss` int(11) NOT NULL DEFAULT '0',
  `mu_only` int(11) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `ss_node`
--

INSERT INTO `ss_node` (`id`, `name`, `type`, `server`, `method`, `info`, `status`, `sort`, `custom_method`, `traffic_rate`, `node_class`, `node_speedlimit`, `node_connector`, `node_bandwidth`, `node_bandwidth_limit`, `bandwidthlimit_resetday`, `node_heartbeat`, `node_ip`, `node_group`, `custom_rss`, `mu_only`) VALUES
(1, '统一验证登陆', 0, '', 'radius', '统一登陆验证', '可用', 999, 0, 1, 0, '0.00', 0, 0, 0, 0, 0, '', 0, 0, 0),
(2, 'VPN 统一流量结算', 0, '', 'radius', 'VPN 统一流量结算', '可用', 999, 0, 1, 0, '0.00', 0, 0, 0, 0, 0, NULL, 0, 0, 0),
(3, '第一个节点', 1, '0.0.0.0', 'aes-256-cfb', '可用', '点击查看二维码', 0, 1, 1, 0, '0.00', 0, 0, 0, 0, 0, '0.0.0.0', 0, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ss_node_info`
--

CREATE TABLE IF NOT EXISTS `ss_node_info` (
  `id` int(11) NOT NULL,
  `node_id` int(11) NOT NULL,
  `uptime` float NOT NULL,
  `load` varchar(32) NOT NULL,
  `log_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ss_node_online_log`
--

CREATE TABLE IF NOT EXISTS `ss_node_online_log` (
  `id` int(11) NOT NULL,
  `node_id` int(11) NOT NULL,
  `online_user` int(11) NOT NULL,
  `log_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ss_password_reset`
--

CREATE TABLE IF NOT EXISTS `ss_password_reset` (
  `id` int(11) NOT NULL,
  `email` varchar(32) NOT NULL,
  `token` varchar(128) NOT NULL,
  `init_time` int(11) NOT NULL,
  `expire_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `telegram_session`
--

CREATE TABLE IF NOT EXISTS `telegram_session` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `session_content` text NOT NULL,
  `datetime` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `ticket`
--

CREATE TABLE IF NOT EXISTS `ticket` (
  `id` bigint(20) NOT NULL,
  `title` longtext NOT NULL,
  `content` longtext NOT NULL,
  `rootid` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `datetime` bigint(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `unblockip`
--

CREATE TABLE IF NOT EXISTS `unblockip` (
  `id` bigint(20) NOT NULL,
  `ip` text NOT NULL,
  `datetime` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `user_name` varchar(128) CHARACTER SET utf8mb4 NOT NULL,
  `email` varchar(32) NOT NULL,
  `pass` varchar(64) NOT NULL,
  `passwd` varchar(16) NOT NULL,
  `t` int(11) NOT NULL DEFAULT '0',
  `u` bigint(20) NOT NULL,
  `d` bigint(20) NOT NULL,
  `plan` varchar(2) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'A',
  `transfer_enable` bigint(20) NOT NULL,
  `port` int(11) NOT NULL,
  `switch` tinyint(4) NOT NULL DEFAULT '1',
  `enable` tinyint(4) NOT NULL DEFAULT '1',
  `type` tinyint(4) NOT NULL DEFAULT '1',
  `last_get_gift_time` int(11) NOT NULL DEFAULT '0',
  `last_check_in_time` int(11) NOT NULL DEFAULT '0',
  `last_rest_pass_time` int(11) NOT NULL DEFAULT '0',
  `reg_date` datetime NOT NULL,
  `invite_num` int(8) NOT NULL,
  `money` decimal(12,2) NOT NULL,
  `ref_by` int(11) NOT NULL DEFAULT '0',
  `expire_time` int(11) NOT NULL DEFAULT '0',
  `method` varchar(64) NOT NULL DEFAULT 'rc4-md5',
  `is_email_verify` tinyint(4) NOT NULL DEFAULT '0',
  `reg_ip` varchar(128) NOT NULL DEFAULT '127.0.0.1',
  `node_speedlimit` decimal(12,2) NOT NULL DEFAULT '0.00',
  `node_connector` int(11) NOT NULL DEFAULT '0',
  `is_admin` int(2) NOT NULL DEFAULT '0',
  `im_type` int(11) DEFAULT '1',
  `im_value` text,
  `last_day_t` bigint(20) NOT NULL DEFAULT '0',
  `sendDailyMail` int(11) NOT NULL DEFAULT '1',
  `class` int(11) NOT NULL DEFAULT '0',
  `class_expire` datetime NOT NULL DEFAULT '1989-06-04 00:05:00',
  `expire_in` datetime NOT NULL DEFAULT '2099-06-04 00:05:00',
  `theme` text NOT NULL,
  `ga_token` text NOT NULL,
  `ga_enable` int(11) NOT NULL DEFAULT '0',
  `pac` longtext,
  `remark` text,
  `node_group` int(11) NOT NULL DEFAULT '0',
  `auto_reset_day` int(11) NOT NULL DEFAULT '0',
  `auto_reset_bandwidth` decimal(12,2) NOT NULL DEFAULT '0.00',
  `protocol` varchar(128) DEFAULT 'origin',
  `protocol_param` varchar(128) DEFAULT NULL,
  `obfs` varchar(128) DEFAULT 'plain',
  `obfs_param` varchar(128) DEFAULT NULL,
  `forbidden_ip` longtext,
  `forbidden_port` longtext,
  `disconnect_ip` longtext,
  `is_hide` int(11) NOT NULL DEFAULT '0',
  `is_multi_user` int(11) NOT NULL DEFAULT '0',
  `telegram_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` VALUES (1,'Administrator','admin@domain.local','dedb6d897de47ebab9ead6d80883775abcd605c1c57d46e71e8f5d631fb02a8e','iHAH6jh0uD9TsYdg',0,0,0,'A',107374182400,10240,1,1,1,0,0,0,'2018-01-01 00:00:00',0,10000.00,0,0,'chacha20-ietf',0,'127.0.0.1',0.00,0,1,1,'',0,0,9,'8102-12-31 23:59:59','8102-12-31 23:59:59','cute','2TFGSYHQ3FJLZSWX',0,NULL,NULL,0,0,0.00,'origin',NULL,'plain',NULL,NULL,NULL,NULL,0,0,NULL);

-- --------------------------------------------------------

--
-- 表的结构 `user_token`
--

CREATE TABLE IF NOT EXISTS `user_token` (
  `id` int(11) NOT NULL,
  `token` varchar(256) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `expire_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `user_traffic_log`
--

CREATE TABLE IF NOT EXISTS `user_traffic_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `u` bigint(20) NOT NULL,
  `d` bigint(20) NOT NULL,
  `node_id` int(11) NOT NULL,
  `rate` float NOT NULL,
  `traffic` varchar(32) NOT NULL,
  `log_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alive_ip`
--
ALTER TABLE `alive_ip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auto`
--
ALTER TABLE `auto`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blockip`
--
ALTER TABLE `blockip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bought`
--
ALTER TABLE `bought`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `code`
--
ALTER TABLE `code`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detect_list`
--
ALTER TABLE `detect_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detect_log`
--
ALTER TABLE `detect_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `disconnect_ip`
--
ALTER TABLE `disconnect_ip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_verify`
--
ALTER TABLE `email_verify`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `link`
--
ALTER TABLE `link`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_ip`
--
ALTER TABLE `login_ip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payback`
--
ALTER TABLE `payback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paylist`
--
ALTER TABLE `paylist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `radius_ban`
--
ALTER TABLE `radius_ban`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `relay`
--
ALTER TABLE `relay`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `speedtest`
--
ALTER TABLE `speedtest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ss_invite_code`
--
ALTER TABLE `ss_invite_code`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ss_node`
--
ALTER TABLE `ss_node`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ss_node_info`
--
ALTER TABLE `ss_node_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ss_node_online_log`
--
ALTER TABLE `ss_node_online_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ss_password_reset`
--
ALTER TABLE `ss_password_reset`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `telegram_session`
--
ALTER TABLE `telegram_session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unblockip`
--
ALTER TABLE `unblockip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_name` (`user_name`),
  ADD KEY `uid` (`id`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_traffic_log`
--
ALTER TABLE `user_traffic_log`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alive_ip`
--
ALTER TABLE `alive_ip`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `announcement`
--
ALTER TABLE `announcement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auto`
--
ALTER TABLE `auto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `blockip`
--
ALTER TABLE `blockip`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bought`
--
ALTER TABLE `bought`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `code`
--
ALTER TABLE `code`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `coupon`
--
ALTER TABLE `coupon`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `detect_list`
--
ALTER TABLE `detect_list`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `detect_log`
--
ALTER TABLE `detect_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `disconnect_ip`
--
ALTER TABLE `disconnect_ip`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `email_verify`
--
ALTER TABLE `email_verify`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `link`
--
ALTER TABLE `link`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `login_ip`
--
ALTER TABLE `login_ip`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `payback`
--
ALTER TABLE `payback`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `paylist`
--
ALTER TABLE `paylist`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `radius_ban`
--
ALTER TABLE `radius_ban`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `relay`
--
ALTER TABLE `relay`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `shop`
--
ALTER TABLE `shop`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `speedtest`
--
ALTER TABLE `speedtest`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ss_invite_code`
--
ALTER TABLE `ss_invite_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ss_node`
--
ALTER TABLE `ss_node`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ss_node_info`
--
ALTER TABLE `ss_node_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ss_node_online_log`
--
ALTER TABLE `ss_node_online_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ss_password_reset`
--
ALTER TABLE `ss_password_reset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `telegram_session`
--
ALTER TABLE `telegram_session`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unblockip`
--
ALTER TABLE `unblockip`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_traffic_log`
--
ALTER TABLE `user_traffic_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
