# 切换到下载目录
cd "$DOWNLOAD_PATH" || exit 1

# 定义 Mesa GLU 的版本
GLU_VERSION="9.0.2"  # 可根据需要调整版本
GLU_URL="https://mesa.freedesktop.org/archive/glu/glu-${GLU_VERSION}.tar.gz"

# 下载 Mesa GLU 的源码包
echo "Downloading libglu1-mesa-dev (GLU) from $GLU_URL..."
wget "$GLU_URL" -O "glu-${GLU_VERSION}.tar.gz" || { echo "Download failed!"; exit 1; }

# 解压源码包
echo "Extracting glu-${GLU_VERSION}.tar.gz..."
tar -xzf "glu-${GLU_VERSION}.tar.gz" || { echo "Extraction failed!"; exit 1; }

# 进入源码目录
cd "glu-${GLU_VERSION}" || exit 1

# 配置、编译和安装
echo "Configuring build..."
./configure --prefix="$INSTALL_PATH" || { echo "Configuration failed!"; exit 1; }

echo "Building..."
make -j$(nproc) || { echo "Build failed!"; exit 1; }

echo "Installing..."
make install || { echo "Installation failed!"; exit 1; }

echo "libglu1-mesa-dev installed successfully to $INSTALL_PATH"