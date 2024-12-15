#!/bin/sh

# 检查是否以 root 用户运行
if [ "$(id -u)" -ne 0 ]; then
  echo "请以 root 用户运行此脚本"
  exit 1
fi

# 设置交换文件路径和大小
SWAPFILE="/swapfile"
SWAPSIZE_MB=1024  # 1GB

# 创建交换文件
echo "创建交换文件..."
dd if=/dev/zero of=$SWAPFILE bs=1M count=$SWAPSIZE_MB status=progress

# 设置交换文件权限
echo "设置交换文件权限..."
chmod 600 $SWAPFILE

# 配置交换空间
echo "配置交换空间..."
mkswap $SWAPFILE

# 启用交换空间
echo "启用交换空间..."
swapon $SWAPFILE

# 将交换空间设置为开机自动挂载
echo "设置交换空间在开机时自动挂载..."
echo "$SWAPFILE none swap sw 0 0" >> /etc/fstab

# 设置 swappiness 参数（可选）
echo "设置 swappiness 参数为 10..."
echo "vm.swappiness=10" >> /etc/sysctl.conf
sysctl -p

# 验证交换空间是否已启用
echo "交换空间已启用，当前状态："
swapon -s

echo "虚拟内存（交换空间）设置完成！"
