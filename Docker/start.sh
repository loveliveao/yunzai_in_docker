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
echo -e "${RED}正在检查 Yunzai 目录是否存在且不为空...${NC}"
if [ ! -d "/Yunzai" ] || [ -z "$(ls -A /Yunzai)" ]; then
    echo -e "${GREEN}Yunzai 目录不存在或为空，正在克隆 Yunzai ...${NC}"

    # 克隆 Yunzai
    git clone https://gitee.com/TimeRainStarSky/Yunzai /Yunzai
    echo -e "${GREEN}Yunzai 克隆完成。${NC}"
    cd /Yunzai

    # 注释掉克隆插件的部分
    echo -e "${GREEN}正在克隆插件...${NC}"
    git clone --depth 1 https://gitee.com/yoimiya-kokomi/miao-plugin plugins/miao-plugin
    git clone --depth 1 https://gitee.com/TimeRainStarSky/Yunzai-genshin.git plugins/genshin
    git clone --depth 1 https://gitee.com/guoba-yunzai/guoba-plugin.git plugins/Guoba-Plugin
    git clone --depth 1 https://gitee.com/kyrzy0416/rconsole-plugin.git plugins/rconsole-plugin

    # 安装 Node.js 依赖
    echo -e "${GREEN}正在安装 Node.js 依赖...${NC}"
    npm --registry=https://registry.npmmirror.com install pnpm -g
    pnpm config set registry https://registry.npmmirror.com
    pnpm install -P
    echo -e "${GREEN}Node.js 依赖安装完成。${NC}"

    # 安装全局的 Freyr 工具
    echo -e "${GREEN}正在安装全局 Freyr 工具...${NC}"
    npm install -g freyr
    echo -e "${GREEN}Freyr 安装完成。${NC}"

    # 安装 Python 依赖
    echo -e "${GREEN}正在安装 Python 依赖 yt-dlp...${NC}"
    pip install yt-dlp
    echo -e "${GREEN}Python 依赖安装完成。${NC}"
else
    echo -e "${RED}Yunzai 目录已存在且不为空，将跳过克隆和安装依赖步骤...${NC}"
    cd /Yunzai
fi

# 启动 Yunzai 并在前台运行
echo -e "${RED}即将启动 Yunzai...${NC}"
node .