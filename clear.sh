#!/bin/sh

# 一键清理 Alpine Linux 垃圾文件的脚本

echo "开始清理 Alpine Linux 系统..."

# 1. 清理 APK 包缓存
echo "清理 APK 包缓存..."
apk cache clean

# 2. 删除不再需要的包和依赖
echo "删除不再需要的包..."
apk autoremove

# 3. 清理系统日志文件
echo "清理系统日志文件..."
rm -rf /var/log/*

# 4. 清理临时文件
echo "清理临时文件..."
rm -rf /tmp/*

# 5. 更新系统
echo "更新系统..."
apk update
apk upgrade

echo "清理完成！"
