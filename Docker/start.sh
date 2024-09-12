#!/bin/bash

# 定义颜色代码
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # 无颜色

# 输出带颜色的消息
print_message() {
    local color=$1
    local message=$2
    echo -e "${color}${message}${NC}"
}

# 脚本开始
print_message "$YELLOW" "=== Yunzai 初始化脚本开始 ==="

# 步骤 1: 启动 Redis 服务器
print_message "$GREEN" "步骤 1: 启动 Redis 服务器"
redis-server --daemonize yes &> /dev/null
print_message "$GREEN" "Redis 服务器已启动"

# 步骤 2: 检查并初始化 Yunzai
print_message "$GREEN" "步骤 2: 检查 Yunzai 目录"
if [ -z "$(ls -A /Yunzai)" ]; then
    print_message "$YELLOW" "Yunzai 目录为空，开始初始化..."

    # 克隆 Yunzai
    git clone https://gitee.com/TimeRainStarSky/Yunzai /Yunzai
    cd /Yunzai
    print_message "$GREEN" "Yunzai 克隆完成"

    # 克隆插件
    print_message "$GREEN" "正在克隆插件..."
    git clone --depth 1 https://gitee.com/yoimiya-kokomi/miao-plugin plugins/miao-plugin
    git clone --depth 1 https://gitee.com/TimeRainStarSky/Yunzai-genshin.git plugins/genshin
    git clone --depth 1 https://gitee.com/guoba-yunzai/guoba-plugin.git plugins/Guoba-Plugin
    git clone --depth 1 https://gitee.com/kyrzy0416/rconsole-plugin.git plugins/rconsole-plugin
    print_message "$GREEN" "插件克隆完成"

    # 安装依赖
    print_message "$YELLOW" "安装 Node.js 依赖..."
    npm --registry=https://registry.npmmirror.com install pnpm -g
    pnpm config set registry https://registry.npmmirror.com
    pnpm install -P
    print_message "$GREEN" "Node.js 依赖安装完成"

    print_message "$YELLOW" "安装全局 Freyr 工具..."
    npm install -g freyr
    npm install -g binary-version-check@latest formidable@latest resolve-url@latest superagent@latest
    npm update -g freyr
    print_message "$GREEN" "Freyr 及其依赖安装完成"

    print_message "$YELLOW" "安装 Python 依赖 yt-dlp..."
    pip3 install yt-dlp
    print_message "$GREEN" "Python 依赖安装完成"

    # 首次启动 Yunzai 以生成配置文件
    print_message "$YELLOW" "首次启动 Yunzai 以生成配置文件..."
    pm2 start app.js --name "yunzai" --max-memory-restart 1G
    sleep 10
    pm2 stop yunzai
    print_message "$GREEN" "配置文件生成完成"

    # 修改 bot.yaml 配置
    if [ -f "/Yunzai/config/config/bot.yaml" ]; then
        print_message "$YELLOW" "修改 bot.yaml 配置..."
        sed -i 's/localhost/0.0.0.0/g' /Yunzai/config/config/bot.yaml
        print_message "$GREEN" "bot.yaml 配置修改完成"
    else
        print_message "$RED" "未找到 bot.yaml 文件，请检查 Yunzai 是否正确初始化"
    fi
else
    print_message "$GREEN" "Yunzai 目录不为空，跳过初始化步骤"
    cd /Yunzai

    # 更新依赖
    print_message "$YELLOW" "更新 Node.js 依赖..."
    pnpm install -P
    print_message "$GREEN" "Node.js 依赖更新完成"

    print_message "$YELLOW" "更新 Freyr 及其依赖..."
    npm install -g binary-version-check@latest formidable@latest resolve-url@latest superagent@latest
    npm update -g freyr
    print_message "$GREEN" "Freyr 及其依赖更新完成"
fi

# 步骤 3: 启动 Yunzai
print_message "$GREEN" "步骤 3: 启动 Yunzai"
print_message "$YELLOW" "使用 pm2 启动 Yunzai..."
pm2 restart yunzai || pm2 start app.js --name "yunzai" --max-memory-restart 1G
print_message "$GREEN" "Yunzai 启动完成"

# 脚本结束
print_message "$YELLOW" "=== Yunzai 初始化脚本结束 ==="

# 显示 pm2 日志
print_message "$GREEN" "正在显示 pm2 日志..."
pm2 logs