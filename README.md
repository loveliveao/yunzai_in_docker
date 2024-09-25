<div align="center">
  
# ☁️Yunzai_in_Docker🐋

**优雅地通过docker使用Trss-Yunzai!**

DockerHub地址：https://hub.docker.com/r/loveliveao/yunzai_in_docker

</div>

[![Core](https://img.shields.io/badge/Lagrange-Core-blue)](#)


## 👍项目特性
- 基本使用国内源，安装依赖拉取速度更快
- 支持配置文件持久化，只需挂载`/Yunzai`文件夹即可
- 方便的插件安装体验，仅需复制插件安装脚本到控制台即可轻松安装插件
- 重要依赖安装较全，提供`FFmpeg`、`chromium`依赖
- 使用[pm2](https://pm2.io/)进行进程管理，重启yunzai更优雅，[使用方法见此](https://github.com/loveliveao/yunzai_in_docker/edit/main/README.md#%E4%BD%BF%E7%94%A8pm2%E6%8E%A7%E5%88%B6yunzai%E8%BF%9B%E7%A8%8B)
- 对Unraid系统支持友好，通过Docker部署 `loveliveao/yunzai_in_docker`，提供[图标链接地址](https://github.com/loveliveao/yunzai_in_docker/tree/main/icons)


## ✈部署阶段

推荐使用 [Lagrange](https://github.com/LagrangeDev/Lagrange.Core) 或 [NapCatQQ](https://github.com/NapNeko/NapCatQQ) 作为 **协议端** 通过`反向WebSocket`连接到本项目。


### 部署 Lagrange 或 NapCatQQ
<details>
  <summary>👉点击查看Lagrange部署方法</summary>
  
[Lagrange官方docker文档](https://github.com/LagrangeDev/Lagrange.Core/blob/master/Docker_zh.md)

</details>

<details>
  <summary>👉点击查看NapCatQQ部署方法</summary>
  
[点击此处查看NapCatQQ官方docker文档](https://github.com/NapNeko/NapCat-Docker/blob/main/README.md)

</details>

### 通过 Unraid 部署 yunzai_in_docker

<details>
  <summary>👉点击查看yunzai_in_unraid部署方法</summary>
  
```
1.打开您的Unriad WEBUI，格式通常如下`http://[IP]:[PORT]`，如`http://10.0.0.10:80`
2.点击到Unraid WEBUI中的`应用`选项卡，相应地址为`http://[IP]:[PORT]/Apps`，如`http://10.0.0.10:80/Apps`
3.搜索yunzai_in_docker,点击右侧`单击此处从DockerHub获取更多结果`，可通过CA自动确认变量，可自行映射/Yunzai目录至宿主机中
4.固定此容器的ip地址，并修改Lagrange或NapCatQQ配置中的反向WebSocket
```
  
</details>

> [!NOTE]
> - `2536端口` 用于 `反向WebSocket` 和 `锅巴插件` 默认登录端口
> - `/Yunzai` 目录 被用于存储TRSS-Yunzai运行时的文件，可直接映射
> - 自动将 `TRSS-Yunzai` 的 `反向WebSocket` 监听地址修改为 `0.0.0.0`，多docker配置更方便

## 🛫使用阶段

> [!IMPORTANT]
>   
> - 首次运行时间可能较长，请耐心等待：
> - 使用debian作为基础镜像，可直接使用debian系统命令
> - 使用pm2进行Yunzai进程管理，请仔细阅读相关内容

### ⚠使用pm2控制Yunzai进程

<details>
  <summary>👉点击查看pm2使用方法</summary>

#### 启动Yunzai
```bash
pm2 start yunzai
```

#### 停止Yunzai
```bash
pm2 start yunzai
```

#### 重启Yunzai
```bash
pm2 start yunzai
```

#### 查看Yunzai日志
```bash
pm2 logs --watch yunzai
```
</details>

### 安装插件及其他依赖

<details>
  <summary>👉点击查看pm2使用方法</summary>
  
#### 进入docker控制台
  ```bash
  
 docker exec -it [容器名称或ID] /bin/bash
 
  ```

#### 输入插件安装命令

```bash
# 国内
git clone https://gitee.com/kyrzy0416/rconsole-plugin.git ./plugins/rconsole-plugin/
# 海外
git clone https://github.com/zhiyu1998/rconsole-plugin.git ./plugins/rconsole-plugin/
```

#### 输入依赖安装命令

```bash
apt-get install yt-dlp
npm install -g freyr
```

</details>

## 相关项目/致谢

| Nickname | Contribution |
| -------- | ------------ |
| [Yunzai-Bot](https://gitee.com/le-niao/Yunzai-Bot)| 👑Yunzai-Bot开山鼻祖 |
| [TRSS-Yunzai](https://github.com/TimeRainStarSky/Yunzai) | 🤖强大繁荣的机器人框架 |
| [Lagrange](https://github.com/LagrangeDev/Lagrange.Core) | 🐧稳定的NTQQ协议实现 |
| [NapCatQQ](https://github.com/NapNeko/NapCatQQ) | 🐧现代化的基于NTQQ的Bot协议端实现 |
| [R插件](https://github.com/zhiyu1998/rconsole-plugin) | 💕本人心中最佳插件 |
