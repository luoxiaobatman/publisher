---
created: 2023-06-12
share: true
category: 项目
title: 
---

> Opportunity is missed by most because it is dressed in overalls and looks like work.
> — <cite>Thomas Edison</cite>

### <% tp.file.cursor(2) %>

更改nginx 
```
  location /auth-server {
          proxy_set_header Host $host;
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header REMOTE-HOST $remote_addr;
          proxy_set_header x-forwarded-for $remote_addr;
          proxy_pass  http://172.16.149.88:9091/auth-server;
  }
```


supervisor.conf停掉对应的服务
traefik.yml更改entry
auth.yml更改地址

本地
环境配置改动
platform.base.component.url
platform.base.component.enable
TODO 画个组件注册流程图