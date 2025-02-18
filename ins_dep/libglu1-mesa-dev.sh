# # 切换到下载目录
# cd "$DOWNLOAD_PATH" || exit 1

# DEB_FILE="libglu1-mesa-dev_9.0.2-1.1build1_amd64.deb"
# DEB_URL="https://mirrors.edge.kernel.org/ubuntu/pool/main/libg/libglu/libglu1-mesa-dev_9.0.2-1.1build1_amd64.deb"
# # 检测 .deb 文件是否已存在
# if [[ -f "$DEB_FILE" ]]; then
#     echo "$DEB_FILE 已存在，跳过下载。"
# else
#     echo "$DEB_FILE 不存在，开始下载..."
#     wget "$DEB_URL" -O "$DEB_FILE"
#     if [[ $? -ne 0 ]]; then
#         echo "错误：下载失败！"
#         exit 1
#     fi
# fi
# # 定义 Mesa GLU 的版本

# mkdir tmp
# mv $DEB_FILE ./tmp
# cd tmp
# ar x $DEB_FILE 

# zstd -d data.tar.zst -o data.tar  || { echo "zstd failed!"; exit 1; }
# tar -xf data.tar 

# echo "复制库文件到目标路径..."
# cp "./usr/lib/x86_64-linux-gnu/libGLU.so"* "$INSTALL_PATH/lib"
# cd ../

# rm -rf tmp

# echo "创建符号链接..."
# cd "$INSTALL_PATH/lib"
# ln -sf libGLU.so.1.* libGLU.so.1
# ln -sf libGLU.so.1 libGLU.so