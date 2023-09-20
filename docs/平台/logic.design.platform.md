---
created: 2023-09-18
number headings: first-level 2, start-at 1, max 6, 1.1-
title: logic.design.platform
author: 罗潇
cssclass: wideTable
first-level: 1
pdf-filename: logic.design.platform
platform: true
category: 平台
---

### 逻辑架构

整体逻辑架构分为视图、业务逻辑和数据层。

视图层提供前端展示，支持浏览器、api、PC端、移动端等多种访问手段，保证安全性都通过https进行访问。

业务逻辑层实现认证、用户、资源、系统的业务逻辑处理和业务控制，除四大业务中心外，还包括API网关、消息中心、缓存中心、后台服务及进程守护程序。

数据层实现数据存取，认证中心、用户管理、资源管理和系统管理数据库相互独立，可以单独部署，也可以在同一个库上运行四个数据库实例。