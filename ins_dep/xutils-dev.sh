# 切换到下载目录
cd "$DOWNLOAD_PATH" || exit 1

# 下载 xutils-dev 的源码包
# XUTILS_VERSION="7.7" # 可根据需要调整版本
# XUTILS_URL="https://www.x.org/archive/individual/util/util-macros-${XUTILS_VERSION}.tar.gz"


echo "Downloading xutils-dev (util-macros) "
wget --no-check-certificate https://xorg.freedesktop.org/releases/individual/util/util-macros-1.19.3.tar.bz2

# 解压源码包
echo "Extracting xutils-dev_7.7+5ubuntu2.tar.gz..."
tar -xjf util-macros-1.19.3.tar.bz2 || { echo "Extraction failed!"; exit 1; }

# 进入源码目录
cd util-macros-1.19.3 || exit 1

# 配置、编译和安装
echo "Configuring build..."
./configure --prefix="$INSTALL_PATH" || { echo "Configuration failed!"; exit 1; }

echo "Building..."
make -j$(nproc) || { echo "Build failed!"; exit 1; }

echo "Installing..."
make install || { echo "Installation failed!"; exit 1; }

echo "xutils-dev (util-macros) installed successfully to $INSTALL_PATH"
#---------------
# cd "$DOWNLOAD_PATH" || exit 1
# wget https://www.x.org/releases/individual/proto/xproto-7.0.31.tar.gz
# tar -xvzf xproto-7.0.31.tar.gz
# cd xproto-7.0.31
# ./configure --prefix="$INSTALL_PATH" || { echo "Configuration failed!"; exit 1; }
# make -j$(nproc) || { echo "Build failed!"; exit 1; }
# make install || { echo "Installation failed!"; exit 1; }
# export PKG_CONFIG_PATH="$INSTALL_PATH/lib/pkgconfig:$INSTALL_PATH/share/pkgconfig:$PKG_CONFIG_PATH"


# # --------------
# cd "$DOWNLOAD_PATH" || exit 1
# echo "Downloading imake"
# wget https://www.x.org/releases/individual/util/imake-1.0.8.tar.gz


# echo "Extracting ..."
# tar -xvzf imake-1.0.8.tar.gz|| { echo "Extraction failed!"; exit 1; }
# cd imake-1.0.8 || exit 1
# # 配置、编译和安装
# echo "Configuring build..."
# ./configure --prefix="$INSTALL_PATH" || { echo "Configuration failed!"; exit 1; }

# echo "Building..."
# make -j$(nproc) || { echo "Build failed!"; exit 1; }

# echo "Installing..."
# make install || { echo "Installation failed!"; exit 1; }

# echo "imake installed successfully to $INSTALL_PATH"

