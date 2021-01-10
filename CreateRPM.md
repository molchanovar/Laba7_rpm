## Lab making
``` bash

# 1. Создание rpm пакета 

# Утилиты для сборки 
sudo yum install redhat-lsb-core wget rpmdevtools rpm-build createrepo yum-utils tree gcc python3 git

# Создание директорий rpmbuild{BUILD,RPMS,SOURCES,SPECS,SRPMS}
rpmdev-setuptree

# Загрузка SPEC файла (Исходный код приложения в файле Calendar.py)
git clone https://github.com/molchanovar/Laba7_rpm.git
cp /home/vagrant/Laba7_rpm/calendar.spec /home/vagrant/rpmbuild/SPECS/

# Создание RPM + SRPM пакетов (на выходе получены файлы SimpleCalendar-1.00-1.01.x86_64.rpm и SimpleCalendar-1.00-1.01.src.rpm)
rpmbuild -ba calendar.spec
tree /home/vagrant/rpmbuild

# ├── RPMS
# │   └── x86_64
# │       └── SimpleCalendar-1.00-1.01.x86_64.rpm

# 2. Создание repo и добавление в него rpm пакета 


