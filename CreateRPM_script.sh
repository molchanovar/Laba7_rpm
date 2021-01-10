#!/bin/bash

# 1. Создание rpm пакета 

# Утилиты для сборки 
sudo yum install redhat-lsb-core wget rpmdevtools rpm-build createrepo yum-utils tree gcc python3 git curl lynx

# Создание директорий rpmbuild{BUILD,RPMS,SOURCES,SPECS,SRPMS}
# rpmdev-setuptree
sudo mkdir -p /home/vagrant/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}

# Загрузка SPEC файла (Исходный код приложения в файле Calendar.py)
git clone https://github.com/molchanovar/Laba7_rpm.git
cp /home/vagrant/Laba7_rpm/calendar.spec /home/vagrant/rpmbuild/SPECS/

# Создание RPM + SRPM пакетов (на выходе получены файлы SimpleCalendar-1.00-1.01.x86_64.rpm и SimpleCalendar-1.00-1.01.src.rpm)
rpmbuild -ba /home/vagrant/rpmbuild/SPECS/calendar.spec
tree /home/vagrant/rpmbuild

# ├── RPMS
# │   └── x86_64
# │       └── SimpleCalendar-1.00-1.01.x86_64.rpm


# 2. Создание repo и добавление в него rpm пакета 

# Установка Nginx  
wget https://nginx.org/packages/centos/7/x86_64/RPMS/nginx-1.18.0-2.el7.ngx.x86_64.rpm
sudo yum localinstall -y nginx-1.18.0-2.el7.ngx.x86_64.rpm
sudo systemctl start nginx
sudo systemctl status nginx

# Создание репозитория SimpleCalendar и загрузка своего RPM 
mkdir /usr/share/nginx/html/repo
cp /root/rpmbuild/RPMS/x86_64/SimpleCalendar-1.00-1.01.x86_64.rpm /usr/share/nginx/html/repo/
createrepo /usr/share/nginx/html/repo/
cat >> /etc/yum.repos.d/myApp.repo << EOF 
[Calendar]
name=SimpleCalendar 
baseurl=http://localhost/repo
gpgcheck=0
enabled=1
EOF

cat > /etc/nginx/conf.d/default.conf << EOF
server {
    listen       80;
    server_name  localhost;

    location / {
        root   /usr/share/nginx/html;
        index  index.html index.htm;
    }

    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }
    autoindex on;
}

EOF

# Перезагрузка Nginx
nginx -s reload
nginx -t

# Установка приложения из созданного репозитория 
yum install SimpleCalendar

# Проверка
Calendar.py
