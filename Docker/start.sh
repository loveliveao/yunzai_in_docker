#!/bin/bash

# 定义颜色代码以美化输出信息
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # 无颜色

# 函数：输出带颜色的消息
print_message() {
    local color=$1
    local message=$2
    echo -e "${color}${message}${NC}"
}

# 提示用户脚本正在初始化
print_message "$RED" "正在初始化 Yunzai，请勿退出..."

# 启动 Redis 服务器
print_message "$GREEN" "启动 Redis 服务器..."
redis-server --daemonize yes &> /dev/null

# 检查 Yunzai 目录是否存在且不为空
print_message "$RED" "正在检查 Yunzai 目录是否存在且不为空..."
if [ ! -d "/Yunzai" ] || [ -z "$(ls -A /Yunzai)" ]; then
    print_message "$GREEN" "Yunzai 目录不存在或为空，正在克隆 Yunzai ..."

    # 克隆 Yunzai
    git clone https://gitee.com/TimeRainStarSky/Yunzai /Yunzai
    print_message "$GREEN" "Yunzai 克隆完成。"
    cd /Yunzai || exit

    # 克隆插件
    print_message "$GREEN" "正在克隆插件..."
    git clone --depth 1 https://gitee.com/yoimiya-kokomi/miao-plugin plugins/miao-plugin
    git clone --depth 1 https://gitee.com/TimeRainStarSky/Yunzai-genshin.git plugins/genshin
    git clone --depth 1 https://gitee.com/guoba-yunzai/guoba-plugin.git plugins/Guoba-Plugin
    git clone --depth 1 https://gitee.com/kyrzy0416/rconsole-plugin.git plugins/rconsole-plugin

    # 安装依赖
    print_message "$GREEN" "正在安装 Node.js 依赖..."
    npm --registry=https://registry.npmmirror.com install pnpm -g
    pnpm config set registry https://registry.npmmirror.com
    pnpm install -P
    print_message "$GREEN" "Node.js 依赖安装完成。"

    print_message "$GREEN" "正在安装全局 Freyr 工具..."
    npm install -g freyr
    print_message "$GREEN" "Freyr 安装完成。"

    print_message "$GREEN" "正在安装 Python 依赖 yt-dlp..."
    pip3 install yt-dlp
    print_message "$GREEN" "Python 依赖安装完成。"
else
    print_message "$RED" "Yunzai 目录已存在且不为空，将跳过克隆和安装依赖步骤..."
    cd /Yunzai || exit
fi

# 启动 Yunzai 并在前台运行
print_message "$RED" "即将启动 Yunzai..."
node .