# 切换到下载目录
cd "$DOWNLOAD_PATH" || exit 1

# 定义 bison 的版本
BISON_VERSION="3.8.2" # 可根据需要调整版本
BISON_URL="https://ftp.gnu.org/gnu/bison/bison-${BISON_VERSION}.tar.gz"

# 下载 bison 源码包
echo "Downloading bison from $BISON_URL..."
wget --no-check-certificate "$BISON_URL" -O "bison-${BISON_VERSION}.tar.gz" || { echo "Download failed!"; exit 1; }

# 解压源码包
echo "Extracting bison-${BISON_VERSION}.tar.gz..."
tar -xzf "bison-${BISON_VERSION}.tar.gz" || { echo "Extraction failed!"; exit 1; }

# 进入源码目录
cd "bison-${BISON_VERSION}" || exit 1

# 配置、编译和安装
echo "Configuring build..."
./configure --prefix="$INSTALL_PATH" || { echo "Configuration failed!"; exit 1; }

echo "Building..."
make -j$(nproc) || { echo "Build failed!"; exit 1; }

echo "Installing..."
make install || { echo "Installation failed!"; exit 1; }

echo "bison installed successfully to $INSTALL_PATH"