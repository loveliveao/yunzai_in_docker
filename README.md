<div align="center">
  
# Yunzai_in_Unraid

**在Unraid上优雅地通过docker使用Trss-Yunzai!!!**

推荐使用 [Lagrange](https://github.com/LagrangeDev/Lagrange.Core) 通过`反向WebSocket`连接到本项目。

</div>

[![Core](https://img.shields.io/badge/Lagrange-Core-blue)](#)

## 相关项目/致谢

| Nickname | Contribution |
| -------- | ------------ |
| [Yunzai-Bot](https://gitee.com/le-niao/Yunzai-Bot)| 👑Yunzai-Bot开山鼻祖 |
| [TRSS-Yunzai](https://github.com/TimeRainStarSky/Yunzai) | 🤖强大繁荣的机器人框架 |
| [Lagrange](https://github.com/LagrangeDev/Lagrange.Core) | 🐧稳定的QQNT协议实现 |
| [R插件](https://github.com/zhiyu1998/rconsole-plugin) | 💕本人心中最佳插件 |
## 开始使用

> [!NOTE]
> - 2536端口用于`反向WebSocket` 和 `锅巴插件`默认登录端口
>   
> - `/Yunzai`目录 被用于存储TRSS-Yunzai运行时的文件，可直接映射

### 安装 Lagrange

本文提供两种方法安装 Lagrange

1. 通过 Unraid WEBUI Docker 选项卡中`添加容器`方式安装Lagrange（适用Unraid中高手），详见官方[使用指南](https://github.com/LagrangeDev/Lagrange.Core/blob/master/Docker_zh.md?plain=1)

2. 通过导入本人Xml文件进行安装（适用Unraid低手或懒人）


### 安装Yunzai_in_Unraid

1. 打开您的Unriad WEBUI，格式通常如下`http://[IP]:[PORT]`，如`http://10.0.0.10:80`

2. 点击到Unraid WEBUI中的`应用`选项卡，相应地址为`http://[IP]:[PORT]/Apps`，如`http://10.0.0.10:80/Apps`

3. 搜索






> [!IMPORTANT]
>   
> - 首次运行时间可能较长，可能由于以下两种原因：
>
>   - 您的网络不通畅
>
>   - 正在克隆`TRSS-Yunzai`、`miao-plugin`、`Yunzai-genshin`、`guoba-plugin`、`rconsole-plugin`
>

>
> - 如果需要宿主需要访问实现（例如：`Http`，`ForwardWebSocket`），请将实现的 `Host` 配置为 `*`
> - 如果实现需要访问宿主网络（例如：`HttpPost`，`ReverseWebSocket`），请将实现的 `Host` 配置为 `host.docker.internal`
```bash

```
使用 [Lagrange](https://github.com/LagrangeDev/Lagrange.Core) 通过`ws反向代理`连接到本项目。
