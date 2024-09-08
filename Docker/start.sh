#!/bin/bash

# 启动 Redis 服务器
redis-server --daemonize yes &> /dev/null

# 检查 /Yunzai 目录是否存在且不为空
if [ ! -d "/Yunzai" ] || [ -z "$(ls -A /Yunzai)" ]; then
    echo "Yunzai 目录不存在或为空，正在克隆 Yunzai 及其插件..."
    git clone https://gitee.com/TimeRainStarSky/Yunzai /Yunzai
    cd /Yunzai
    git clone --depth 1 https://gitee.com/yoimiya-kokomi/miao-plugin plugins/miao-plugin
    git clone --depth 1 https://gitee.com/TimeRainStarSky/Yunzai-genshin.git plugins/genshin
    git clone --depth 1 https://gitee.com/guoba-yunzai/guoba-plugin.git plugins/Guoba-Plugin
    # 安装依赖
    npm --registry=https://registry.npmmirror.com install pnpm -g
    pnpm config set registry https://registry.npmmirror.com
    pnpm install -P
else
    echo "Yunzai 目录存在且不为空，直接启动 Yunzai..."
    cd /Yunzai
fi

# 启动 Yunzai 应用
node .