# 3.修改 SSH 端口
# 打开新的 SSH 端口
ufw allow 2500/tcp
# 修改 SSH 默认端口
sed -i '$ a Port 2500' /etc/ssh/sshd_config
# 禁止密码登录（但是 root 可以）
# sed -i '$ a PasswordAuthentication no' /etc/ssh/sshd_config
# 禁用原始的SSH端口
ufw deny 22/tcp
# 加载 SSH 服务器以使更改生效
systemctl reload sshd
# 使用以下命令检查 SSH 服务是否正在监听新端口
# ss -tunlp | grep ssh
ufw status
