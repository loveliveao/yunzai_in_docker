# 使用 Debian 作为基础镜像
FROM debian:bullseye-slim

# 设置非交互式安装
ARG DEBIAN_FRONTEND=noninteractive

# 设置时区为中国上海
ENV TZ=Asia/Shanghai
# 设置 Puppeteer 环境变量
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

# 设置工作目录为 /Yunzai
WORKDIR /Yunzai

# 替换软件源为阿里云并安装基础依赖
RUN sed -i 's@http://deb.debian.org/@http://mirrors.aliyun.com/@g' /etc/apt/sources.list && \
    sed -i 's@http://security.debian.org/@http://mirrors.aliyun.com/@g' /etc/apt/sources.list && \
    apt-get update -y && \
    apt-get install -y --no-install-recommends wget xz-utils dos2unix curl gnupg git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 安装其他依赖
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends fonts-wqy-microhei xfonts-utils chromium fontconfig libxss1 libgl1 vim jq python3 python3-pip python3-dev redis-server procps ffmpeg atomicparsley && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

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
COPY ./start.sh /

# 暴露端口
EXPOSE 2536/tcp

# 设置工作目录为 /Yunzai
WORKDIR /Yunzai

# 指定容器启动时执行的命令
CMD ["/bin/bash", "/start.sh"]