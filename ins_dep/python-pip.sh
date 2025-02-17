if ! command -v python3 &>/dev/null; then
    echo "Python3 未安装！请先安装 Python3。"
    exit 1
fi

# 检查是否已经安装 pip
if command -v pip3 &>/dev/null; then
    echo "pip 已经安装，版本为：$(pip3 --version)"
    exit 0
fi

# 使用官方推荐方式安装 pip
echo "Downloading get-pip.py..."
curl -sS https://bootstrap.pypa.io/get-pip.py -o get-pip.py || { echo "下载 get-pip.py 失败！"; exit 1; }

# 安装 pip
echo "Installing pip..."
python3 get-pip.py || { echo "安装 pip 失败！"; rm -f get-pip.py; exit 1; }

# 清理安装文件
rm -f get-pip.py

# 检查 pip 是否安装成功
if command -v pip3 &>/dev/null; then
    echo "pip 安装成功，版本为：$(pip3 --version)"
else
    echo "pip 安装失败！"
    exit 1
fi