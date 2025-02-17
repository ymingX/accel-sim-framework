# 切换到下载目录
cd "$DOWNLOAD_PATH" || exit 1

# 定义 libxml2 的版本
LIBXML2_VERSION="2.11.5"  # 可根据需要调整版本
LIBXML2_URL="http://xmlsoft.org/sources/libxml2-${LIBXML2_VERSION}.tar.gz"

# 下载 libxml2 的源码包
echo "Downloading libxml2 from $LIBXML2_URL..."
wget "$LIBXML2_URL" -O "libxml2-${LIBXML2_VERSION}.tar.gz" || { echo "Download failed!"; exit 1; }

# 解压源码包
echo "Extracting libxml2-${LIBXML2_VERSION}.tar.gz..."
tar -xzf "libxml2-${LIBXML2_VERSION}.tar.gz" || { echo "Extraction failed!"; exit 1; }

# 进入源码目录
cd "libxml2-${LIBXML2_VERSION}" || exit 1

# 配置、编译和安装
echo "Configuring build..."
./configure --prefix="$INSTALL_PATH" --with-python=no || { echo "Configuration failed!"; exit 1; }

echo "Building..."
make -j$(nproc) || { echo "Build failed!"; exit 1; }

echo "Installing..."
make install || { echo "Installation failed!"; exit 1; }

echo "libxml2-dev installed successfully to $INSTALL_PATH"