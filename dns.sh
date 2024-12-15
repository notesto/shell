clear
echo "当前DNS地址"
echo "------------------------"
cat /etc/resolv.conf
echo "------------------------"
echo ""
# 询问用户是否要优化DNS设置
read -p "是否要设置为Cloudflare和Google的DNS地址？(y/n): " choice

if [ "$choice" == "y" ]; then
	# 定义DNS地址
	cloudflare_ipv4="1.1.1.1"
	google_ipv4="8.8.8.8"
	cloudflare_ipv6="2606:4700:4700::1111"
	google_ipv6="2001:4860:4860::8888"

	# 检查机器是否有IPv6地址
	ipv6_available=0
	if [[ $(ip -6 addr | grep -c "inet6") -gt 0 ]]; then
		ipv6_available=1
	fi

	# 设置DNS地址为Cloudflare和Google（IPv4和IPv6）
	echo "设置DNS为Cloudflare和Google"

	# 设置IPv4地址
	echo "nameserver $cloudflare_ipv4" > /etc/resolv.conf
	echo "nameserver $google_ipv4" >> /etc/resolv.conf

	# 如果有IPv6地址，则设置IPv6地址
	if [[ $ipv6_available -eq 1 ]]; then
		echo "nameserver $cloudflare_ipv6" >> /etc/resolv.conf
		echo "nameserver $google_ipv6" >> /etc/resolv.conf
	fi

	echo "DNS地址已更新"
	echo "------------------------"
	cat /etc/resolv.conf
	echo "------------------------"
else
	echo "DNS设置未更改"
fi
