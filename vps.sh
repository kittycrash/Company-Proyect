	#apt-get update
	#apt-get install -y squid curl nano sysv-rc-conf ulatency ulatencyd
	
	#cd /etc/ssh/

	#echo "$(sed 's/420/664/g' sshd_config)" > sshd_config
	#echo "" >> sshd_config	
	echo "Port 420" >> sshd_config	
	
	ip=$(wget -qO - icanhazip.com)
	
	echo "# PORTAS DE ACESSO NO SQUID" > /etc/squid/squid.conf
	echo "http_port 4200" >> /etc/squid/squid.conf
	echo "http_port 6640" >> /etc/squid/squid.conf
	echo "http_port 619" >> /etc/squid/squid.conf
	echo "http_port 3128" >> /etc/squid/squid.conf
	echo "" >> /etc/squid/squid.conf
	echo "" >> /etc/squid/squid.conf
	echo "# ExtremNetwork.com" >> /etc/squid/squid.conf
	echo "visible_hostname ExtremNetwork.com" >> /etc/squid/squid.conf
	echo "" >> /etc/squid/squid.conf
	echo "" >> /etc/squid/squid.conf
	echo "# ACL DE CONEXION" >> /etc/squid/squid.conf
	echo "acl accept src $ip" >> /etc/squid/squid.conf
	echo "acl ip url_regex -i $ip" >> /etc/squid/squid.conf
	echo "" >> /etc/squid/squid.conf
	echo "" >> /etc/squid/squid.conf
	echo "# CACHE DE SQUID" >> /etc/squid/squid.conf
	echo "cache_mem 256 MB" >> /etc/squid/squid.conf
	echo "maximum_object_size_in_memory 32 KB" >> /etc/squid/squid.conf
	echo "maximum_object_size 4096 MB" >> /etc/squid/squid.conf
	echo "minimum_object_size 0 KB" >> /etc/squid/squid.conf
	echo "cache_swap_low 90" >> /etc/squid/squid.conf
	echo "cache_swap_high 95" >> /etc/squid/squid.conf
	echo "cache_dir aufs /var/spool/squid 1024 32 96 " >> /etc/squid/squid.conf
	echo "access_log /var/log/squid/access.log squid" >> /etc/squid/squid.conf
	echo "" >> /etc/squid/squid.conf
	echo "" >> /etc/squid/squid.conf
	echo "# ACESSOS ACL" >> /etc/squid/squid.conf
	echo "http_access allow accept" >> /etc/squid/squid.conf
	echo "http_access allow ip" >> /etc/squid/squid.conf
	echo "http_access deny all" >> /etc/squid/squid.conf
	echo "cache deny all" >> /etc/squid/squid.conf

	sysv-rc-conf squid on

	service squid restart

	service ssh restart
	
	clear
	echo "Servidor/Proxy"
	echo "$i"
	echo "Port: 4200, 664, 6640 y 3128"
	echo "Port SSH: 420"



	apt-get update
	apt-get install -y squid3 curl nano sysv-rc-conf ulatency ulatencyd
	
	cd /etc/ssh/

	echo "$(sed 's/420/664/g' sshd_config)" > sshd_config
	echo "" >> sshd_config	
	echo "Port 420" >> sshd_config		
	
	ip=$(wget -qO - icanhazip.com)
	
	echo "# PORTAS DE ACESSO NO SQUID" > /etc/squid3/squid.conf
	echo "http_port 4200" >> /etc/squid3/squid.conf
	echo "http_port 6640" >> /etc/squid3/squid.conf
	echo "http_port 619" >> /etc/squid3/squid.conf
	echo "http_port 3128" >> /etc/squid3/squid.conf
	echo "" >> /etc/squid3/squid.conf
	echo "" >> /etc/squid3/squid.conf
	echo "# ExtremNetwork.com" >> /etc/squid3/squid.conf
	echo "visible_hostname ExtremNetwork.com" >> /etc/squid3/squid.conf
	echo "" >> /etc/squid3/squid.conf
	echo "" >> /etc/squid3/squid.conf
	echo "# ACL DE CONEXION" >> /etc/squid3/squid.conf
	echo "acl accept src $ip" >> /etc/squid3/squid.conf
	echo "acl ip url_regex -i $ip" >> /etc/squid3/squid.conf
	echo "" >> /etc/squid3/squid.conf
	echo "" >> /etc/squid3/squid.conf
	echo "# CACHE DO SQUID" >> /etc/squid3/squid.conf
	echo "cache_mem 256 MB" >> /etc/squid3/squid.conf
	echo "maximum_object_size_in_memory 32 KB" >> /etc/squid3/squid.conf
	echo "maximum_object_size 4096 MB" >> /etc/squid3/squid.conf
	echo "minimum_object_size 0 KB" >> /etc/squid3/squid.conf
	echo "cache_swap_low 90" >> /etc/squid3/squid.conf
	echo "cache_swap_high 95" >> /etc/squid3/squid.conf
	echo "cache_dir aufs /var/spool/squid3 1024 32 96" >> /etc/squid3/squid.conf
	echo "access_log /var/log/squid3/access.log squid" >> /etc/squid3/squid.conf
	echo "cache_log /var/log/squid3/cache.log" >> /etc/squid3/squid.conf
	echo "cache_store_log /var/log/squid3/store.log" >> /etc/squid3/squid.conf
	echo "pid_filename /var/log/squid3/squid3.pid" >> /etc/squid3/squid.conf
	echo "mime_table /usr/share/squid3/mime.conf" >> /etc/squid3/squid.conf
	echo "" >> /etc/squid3/squid.conf
	echo "" >> /etc/squid3/squid.conf
	echo "# ACESSOS ACL" >> /etc/squid3/squid.conf
	echo "http_access allow accept" >> /etc/squid3/squid.conf
	echo "http_access allow ip" >> /etc/squid3/squid.conf
	echo "http_access deny all" >> /etc/squid3/squid.conf
	echo "cache deny all" >> /etc/squid3/squid.conf

	sysv-rc-conf squid3 on

	service squid3 restart

	service ssh restart
	
	clear
	echo "Servidor/Proxy"
	echo "$ip"
	echo "Porta: 664, 4200, 6400 y 3128"
	echo "Porta SSH: 420"

	
	elif cat /etc/issue | grep "Ubuntu" 1>/dev/null 2>/dev/null; then  
	
	ubuntu
	
	else
	echo "Sistema no Compatible..."
	exit
fin
