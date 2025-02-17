# 切换到下载目录
cd "$DOWNLOAD_PATH" || exit 1

# 定义 flex 的版本
FLEX_VERSION="2.6.4" # 可根据需要调整版本
FLEX_URL="https://github.com/westes/flex/releases/download/v${FLEX_VERSION}/flex-${FLEX_VERSION}.tar.gz"

# 下载 flex 源码包
echo "Downloading flex from $FLEX_URL..."
wget "$FLEX_URL" -O "flex-${FLEX_VERSION}.tar.gz" || { echo "Download failed!"; exit 1; }

# 解压源码包
echo "Extracting flex-${FLEX_VERSION}.tar.gz..."
tar -xzf "flex-${FLEX_VERSION}.tar.gz" || { echo "Extraction failed!"; exit 1; }

# 进入源码目录
cd "flex-${FLEX_VERSION}" || exit 1

# 配置、编译和安装
echo "Configuring build..."
./configure --prefix="$INSTALL_PATH" || { echo "Configuration failed!"; exit 1; }

echo "Building..."
make -j$(nproc) || { echo "Build failed!"; exit 1; }

echo "Installing..."
make install || { echo "Installation failed!"; exit 1; }

echo "flex installed successfully to $INSTALL_PATH"