#!/bin/bash

# 设置颜色
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

if [ -z "$INSTALL_PATH" ]; then
    export INSTALL_PATH="$HOME/local"
    echo -e "${ORANGE}INSTALL_PATH is not set. Using default: $INSTALL_PATH${NC}"
else
    echo -e "${GREEN}INSTALL_PATH is set to: $INSTALL_PATH${NC}"
fi

if [ -z "$DOWNLOAD_PATH" ]; then
    export DOWNLOAD_PATH="$HOME/downloads"
    echo -e "${ORANGE}DOWNLOAD_PATH is not set. Using default: $DOWNLOAD_PATH${NC}"
else
    echo -e "${GREEN}DOWNLOAD_PATH is set to: $DOWNLOAD_PATH${NC}"
fi
# 创建 INSTALL_PATH 目录
mkdir -p $INSTALL_PATH
mkdir -p $DOWNLOAD_PATH
# 映射依赖项到实际检查的文件或模块
declare -A dependency_mapping=(
    ["wget"]="wget"
    ["build-essential"]="stdio.h"  # 检查是否有标准库头文件
    ["xutils-dev"]="makedepend"          # 示例：X11 相关头文件
    ["bison"]="bison"
    ["zlib1g-dev"]="zlib.h"
    ["flex"]="flex"
    ["libglu1-mesa-dev"]="libGLU.so"
    ["git"]="git"
    ["g++"]="g++"
    ["libssl-dev"]="libssl.so"
    ["libxml2-dev"]="libxml2.so"
    ["libboost-all-dev"]="boost"  # Boost 头文件
    ["vim"]="vim"
    ["python-setuptools"]="python"
    ["python-pip"]="pip"
)
dependency_order=("wget" "build-essential" "xutils-dev" "bison" "zlib1g-dev" "flex" "libglu1-mesa-dev" "git" "g++" "libssl-dev" "libxml2-dev" "libboost-all-dev" "vim" "python-setuptools" "python-pip")
# 环境变量路径
PATHS=(${C_INCLUDE_PATH//:/ } /usr/include /usr/local/include ${LD_LIBRARY_PATH//:/ } /usr/lib /usr/local/lib ${PATH//:/ } ${PKG_CONFIG_PATH//:/ } )

# 检查函数
check_dependency() {
    local name=$1
    local target=${dependency_mapping[$name]}
    for path in "${PATHS[@]}"; do
        # echo "$path/$target"
        if [ -e "$path/$target" ]; then
            echo -e "${GREEN}Dependency $name ($target) is found in $path.${NC}"
            return 0
        fi
    done
    echo -e "${RED}Dependency $name ($target) is NOT found.${NC}"
    return 1

}

# 检查所有依赖
for dep in "${dependency_order[@]}"; do
    check_dependency "$dep" 
     if [ $? -ne 0 ]; then
        echo -e "Installing missing dependency: ${ORANGE}$dep${NC}"
        
        # 调用对应的 install_xxx.sh 脚本
        script_name="${dep}.sh"
        # if [ -f "./$script_name" ]; then
        #     bash ./$script_name
        # else
        #     echo -e "${RED}Error: $script_name not found. Please create the script to install $dep.${NC}"
        # fi
    fi
done
