# 使用 Ubuntu 20.04 作为基础镜像
FROM ubuntu:20.04

# 设置非交互式安装，避免安装过程中出现交互式提示
ARG DEBIAN_FRONTEND=noninteractive

# 设置时区为中国上海
ENV TZ=Asia/Shanghai

# 设置工作目录为 /Yunzai
# WORKDIR /Yunzai

# 替换软件源为阿里云，加速软件包下载
RUN sed -i 's@/archive.ubuntu.com/@/mirrors.aliyun.com/@g' /etc/apt/sources.list && \
    sed -i 's@/security.ubuntu.com/@/mirrors.aliyun.com/@g' /etc/apt/sources.list && \
    apt-get update -y && \
    apt-get install -y curl git redis-server chromium-browser language-pack-zh-hans \
    libgtk-3-0 libasound2 libgbm1 libnss3 ffmpeg

# 设置中文环境
RUN echo -e "LANG=\"zh_CN.UTF-8\"\nLANGUAGE=\"zh_CN:zh\"\nLC_NUMERIC=\"zh_CN\"\nLC_TIME=\"zh_CN\"\nLC_MONETARY=\"zh_CN\"\nLC_PAPER=\"zh_CN\"\nLC_NAME=\"zh_CN\"\nLC_ADDRESS=\"zh_CN\"\nLC_TELEPHONE=\"zh_CN\"\nLC_MEASUREMENT=\"zh_CN\"\nLC_IDENTIFICATION=\"zh_CN\"\nLC_ALL=\"zh_CN.UTF-8\"" > /etc/default/locale && \
    echo -e "LANG=\"zh_CN.UTF-8\"\nLANGUAGE=\"zh_CN:zh\"\nLC_NUMERIC=\"zh_CN\"\nLC_TIME=\"zh_CN\"\nLC_MONETARY=\"zh_CN\"\nLC_PAPER=\"zh_CN\"\nLC_NAME=\"zh_CN\"\nLC_ADDRESS=\"zh_CN\"\nLC_TELEPHONE=\"zh_CN\"\nLC_MEASUREMENT=\"zh_CN\"\nLC_IDENTIFICATION=\"zh_CN\"\nLC_ALL=\"zh_CN.UTF-8\"" > /etc/environment

# 安装 Node.js
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    node -v; npm -v

# 安装 pnpm 并配置 npm 镜像
RUN npm --registry=https://registry.npmmirror.com install pnpm -g && \
    pnpm config set registry https://registry.npmmirror.com

# 复制启动脚本到容器
COPY start.sh /

# 暴露端口
EXPOSE 2536/tcp
EXPOSE 50831/tcp

# 指定容器启动时执行的命令
CMD ["/bin/bash", "/start.sh"]
