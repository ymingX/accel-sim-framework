
# 切换到下载目录
cd "$DOWNLOAD_PATH" || exit 1

# 定义 zlib 的版本
ZLIB_VERSION="1.2.13" # 可根据需要调整版本
ZLIB_URL="https://zlib.net/zlib-${ZLIB_VERSION}.tar.gz"

# 下载 zlib 源码包
echo "Downloading zlib from $ZLIB_URL..."
wget --no-check-certificate "$ZLIB_URL" -O "zlib-${ZLIB_VERSION}.tar.gz" || { echo "Download failed!"; exit 1; }

# 解压源码包
echo "Extracting zlib-${ZLIB_VERSION}.tar.gz..."
tar -xzf "zlib-${ZLIB_VERSION}.tar.gz" || { echo "Extraction failed!"; exit 1; }

# 进入源码目录
cd "zlib-${ZLIB_VERSION}" || exit 1

# 配置、编译和安装
echo "Configuring build..."
./configure --prefix="$INSTALL_PATH" || { echo "Configuration failed!"; exit 1; }

echo "Building..."
make -j$(nproc) || { echo "Build failed!"; exit 1; }

echo "Installing..."
make install || { echo "Installation failed!"; exit 1; }

echo "zlib1g-dev installed successfully to $INSTALL_PATH"