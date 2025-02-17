# 切换到下载目录
cd "$DOWNLOAD_PATH" || exit 1

# 定义 OpenSSL 的版本
OPENSSL_VERSION="3.0.12"  # 可根据需要调整版本
OPENSSL_URL="https://www.openssl.org/source/openssl-${OPENSSL_VERSION}.tar.gz"

# 下载 OpenSSL 的源码包
echo "Downloading OpenSSL from $OPENSSL_URL..."
wget "$OPENSSL_URL" -O "openssl-${OPENSSL_VERSION}.tar.gz" || { echo "Download failed!"; exit 1; }

# 解压源码包
echo "Extracting openssl-${OPENSSL_VERSION}.tar.gz..."
tar -xzf "openssl-${OPENSSL_VERSION}.tar.gz" || { echo "Extraction failed!"; exit 1; }

# 进入源码目录
cd "openssl-${OPENSSL_VERSION}" || exit 1

# 配置、编译和安装
echo "Configuring build..."
./config --prefix="$INSTALL_PATH" || { echo "Configuration failed!"; exit 1; }

echo "Building..."
make -j$(nproc) || { echo "Build failed!"; exit 1; }

echo "Installing..."
make install || { echo "Installation failed!"; exit 1; }

echo "libssl-dev (OpenSSL) installed successfully to $INSTALL_PATH"