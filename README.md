<div align="center">
  
# 🐋Yunzai_in_Unraid📦

**在Unraid上优雅地通过docker使用Trss-Yunzai!!!**

DockerHub地址：https://hub.docker.com/r/loveliveao/yunzai_in_unraid

</div>

[![Core](https://img.shields.io/badge/Lagrange-Core-blue)](#)


## 👍项目特性
- 基本使用国内源，安装依赖拉取速度更快
- 支持配置文件持久化，只需挂载`/Yunzai`文件夹即可
- 方便的插件安装体验，仅需复制插件安装脚本到控制台即可轻松安装插件
- 重要依赖安装较全，提供`FFmpeg`、`chromium`依赖
- 对Unraid系统支持友好，可在`应用`中搜索`loveliveao/yunzai_in_unraid`，通过DockerHub安装本项目，且提供icon
- 开箱即用的[R插件](https://github.com/zhiyu1998/rconsole-plugin) 体验


## 开始使用

推荐使用 [Lagrange](https://github.com/LagrangeDev/Lagrange.Core) 通过`反向WebSocket`连接到本项目。

> [!NOTE]
> 
> - 2536端口用于`反向WebSocket` 和 `锅巴插件`默认登录端口
>   
> - `/Yunzai`目录 被用于存储TRSS-Yunzai运行时的文件，可直接映射
>
> - 若使用`bridge`网络，造成本项目与`Lagrange`、`NapCatQQ`等容器IP不一致，需手动将`/Yunzai/config/config/bot.yaml`中的`localhost`替换为容器IP

### 安装 Lagrange
请见


### 安装Yunzai_in_Unraid

1. 打开您的Unriad WEBUI，格式通常如下`http://[IP]:[PORT]`，如`http://10.0.0.10:80`

2. 点击到Unraid WEBUI中的`应用`选项卡，相应地址为`http://[IP]:[PORT]/Apps`，如`http://10.0.0.10:80/Apps`

3. 搜索


> [!IMPORTANT]
>   
> - 首次运行时间可能较长，请耐心等待：
>
>   - 正在克隆`TRSS-Yunzai`、`miao-plugin`、`Yunzai-genshin`、`guoba-plugin`、`rconsole-plugin`
>
>   - 您的网络不通畅，请检查日志文件是否提示错误。
>   - 
```bash

```
使用 [Lagrange](https://github.com/LagrangeDev/Lagrange.Core) 通过`ws反向代理`连接到本项目。

## 相关项目/致谢

| Nickname | Contribution |
| -------- | ------------ |
| [Yunzai-Bot](https://gitee.com/le-niao/Yunzai-Bot)| 👑Yunzai-Bot开山鼻祖 |
| [TRSS-Yunzai](https://github.com/TimeRainStarSky/Yunzai) | 🤖强大繁荣的机器人框架 |
| [Lagrange](https://github.com/LagrangeDev/Lagrange.Core) | 🐧稳定的QQNT协议实现 |
| [R插件](https://github.com/zhiyu1998/rconsole-plugin) | 💕本人心中最佳插件 |
