# 切换到下载目录
cd "$DOWNLOAD_PATH" || exit 1

# 下载 xutils-dev 的源码包
XUTILS_VERSION="7.7" # 可根据需要调整版本
XUTILS_URL="https://www.x.org/archive/individual/util/util-macros-${XUTILS_VERSION}.tar.gz"

echo "Downloading xutils-dev (util-macros) from $XUTILS_URL..."
wget "$XUTILS_URL" -O "util-macros-${XUTILS_VERSION}.tar.gz" || { echo "Download failed!"; exit 1; }

# 解压源码包
echo "Extracting util-macros-${XUTILS_VERSION}.tar.gz..."
tar -xzf "util-macros-${XUTILS_VERSION}.tar.gz" || { echo "Extraction failed!"; exit 1; }

# 进入源码目录
cd "util-macros-${XUTILS_VERSION}" || exit 1

# 配置、编译和安装
echo "Configuring build..."
./configure --prefix="$INSTALL_PATH" || { echo "Configuration failed!"; exit 1; }

echo "Building..."
make -j$(nproc) || { echo "Build failed!"; exit 1; }

echo "Installing..."
make install || { echo "Installation failed!"; exit 1; }

echo "xutils-dev (util-macros) installed successfully to $INSTALL_PATH"