#!/bin/bash

# 定义颜色代码以美化输出信息
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # 无颜色

# 提示用户脚本正在初始化
echo -e "${RED}正在初始化 Yunzai，请勿退出...${NC}"

# 克隆 Yunzai
git clone https://gitee.com/TimeRainStarSky/Yunzai /Yunzai
echo -e "${GREEN}Yunzai 克隆完成。${NC}"
cd /Yunzai

# 克隆插件
echo -e "${GREEN}正在克隆插件...${NC}"
git clone --depth 1 https://gitee.com/yoimiya-kokomi/miao-plugin  plugins/miao-plugin
git clone --depth 1 https://gitee.com/TimeRainStarSky/Yunzai-genshin.git  plugins/genshin
git clone --depth 1 https://gitee.com/guoba-yunzai/guoba-plugin.git  plugins/Guoba-Plugin
git clone --depth 1 https://gitee.com/kyrzy0416/rconsole-plugin.git  plugins/rconsole-plugin


# 安装 Node.js 依赖
echo -e "${GREEN}正在安装 Node.js 依赖...${NC}"
npm --registry=https://registry.npmmirror.com install pnpm -g
pnpm config set registry https://registry.npmmirror.com
pnpm install
echo -e "${GREEN}Node.js 依赖安装完成。${NC}"

# 安装全局的 Freyr 工具
echo -e "${GREEN}正在安装全局 Freyr 工具...${NC}"
npm install -g freyr
echo -e "${GREEN}Freyr 安装完成。${NC}"

# 安装 Python 依赖
echo -e "${GREEN}正在安装 Python 依赖 yt-dlp...${NC}"
pip3 install yt-dlp
echo -e "${GREEN}Python 依赖安装完成。${NC}"

# 启动 Yunzai
echo -e "${RED}即将启动 Yunzai...${NC}"
node app.js