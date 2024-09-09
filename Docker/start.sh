#!/bin/bash

# 定义颜色代码以美化输出信息
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # 无颜色

# 提示用户脚本正在初始化
echo -e "${RED}正在初始化 Yunzai，请勿退出...${NC}"

# 启动 Redis 服务器
echo -e "${GREEN}启动 Redis 服务器...${NC}"
redis-server --daemonize yes &> /dev/null

# 检查 Yunzai 目录是否存在且不为空
echo "正在检查 Yunzai 目录是否存在且不为空..."
if [ ! -d "/Yunzai" ] || [ -z "$(ls -A /Yunzai)" ]; then
    echo "Yunzai 目录不存在或为空，正在克隆 Yunzai 及其插件..."
    git clone https://gitee.com/TimeRainStarSky/Yunzai  /Yunzai
    echo "Yunzai 克隆完成。"
    cd /Yunzai


    # 安装 Node.js 依赖
    echo -e "${GREEN}正在安装 Node.js 依赖...${NC}"
    npm --registry=https://registry.npmmirror.com   install pnpm -g
    pnpm config set registry https://registry.npmmirror.com  
    pnpm install -P
    echo "Node.js 依赖安装完成。"

    # 安装全局的 Freyr 工具
    echo -e "${GREEN}正在安装全局 Freyr 工具...${NC}"
    npm install -g freyr
    echo "Freyr 安装完成。"

    # 安装 Python 依赖
    echo -e "${GREEN}正在安装 Python 依赖 yt-dlp...${NC}"
    pip install yt-dlp
    echo "Python 依赖安装完成。"
else
    echo "Yunzai 目录已存在且不为空，将跳过克隆步骤..."
    cd /Yunzai
fi

# 安装 atomicparsley 依赖
echo -e "${GREEN}正在安装 atomicparsley 依赖...${NC}"
apt-get update && apt-get install -y atomicparsley
echo "atomicparsley 安装完成。"

# 启动 Yunzai
echo -e "${GREEN}启动 Yunzai...${NC}"
node . &

# 等待 Yunzai 启动并生成 bot.yaml 文件
echo -e "${GREEN}等待 Yunzai 启动并生成 bot.yaml 文件...${NC}"
sleep 10

# 检查并替换 bot.yaml 配置文件中的 localhost 字段
echo -e "${GREEN}检查 bot.yaml 配置文件中的 localhost 字段是否需要替换...${NC}"
MARKER_FILE="/Yunzai/.config_host_replaced"
if [ ! -f "$MARKER_FILE" ]; then
    if grep -q "localhost" /Yunzai/config/config/bot.yaml; then
        echo "需要将 bot.yaml 配置文件中的 localhost 替换为 0.0.0.0..."
        sed -i 's/localhost/0.0.0.0/g' /Yunzai/config/config/bot.yaml
        echo "配置文件替换完成。"
        touch "$MARKER_FILE"
    else
        echo "bot.yaml 配置文件不需要修改。"
    fi
fi

# 初始化成功提示
echo -e "${GREEN}初始化成功，Yunzai 正在运行...${NC}"
tail -f /dev/null # 保持容器运行