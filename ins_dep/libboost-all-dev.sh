# 切换到下载目录
cd "$DOWNLOAD_PATH" || exit 1

# 定义 Boost 的版本
BOOST_VERSION="1.83.0"  # 可根据需要调整版本
BOOST_VERSION_UNDERSCORE=${BOOST_VERSION//./_}  # 将版本号中的"."替换为"_"
BOOST_URL="https://boostorg.jfrog.io/artifactory/main/release/${BOOST_VERSION}/source/boost_${BOOST_VERSION_UNDERSCORE}.tar.gz"

# 下载 Boost 的源码包
echo "Downloading Boost from $BOOST_URL..."
wget --no-check-certificate "$BOOST_URL" -O "boost_${BOOST_VERSION_UNDERSCORE}.tar.gz" || { echo "Download failed!"; exit 1; }

# 解压源码包
echo "Extracting boost_${BOOST_VERSION_UNDERSCORE}.tar.gz..."
tar -xzf "boost_${BOOST_VERSION_UNDERSCORE}.tar.gz" || { echo "Extraction failed!"; exit 1; }

# 进入源码目录
cd "boost_${BOOST_VERSION_UNDERSCORE}" || exit 1

# 引导 Boost 构建系统
echo "Bootstrapping Boost build system..."
./bootstrap.sh --prefix="$INSTALL_PATH" || { echo "Bootstrap failed!"; exit 1; }

# 编译和安装 Boost
echo "Building and installing Boost..."
./b2 install || { echo "Build and installation failed!"; exit 1; }

echo "libboost-all-dev installed successfully to $INSTALL_PATH"