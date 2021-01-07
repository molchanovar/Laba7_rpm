# Make 
``` bash 
./configure     # Run configurator 
./configure --help
make            # Run building process 
make clean      # Remove all builded files 
male install    # Install compiled programm 
make uninstall  # Uninstall previously installed programm 
```

# RPM

## Basics 

``` bash 
rpm -q pckg_name  # Show is packages installed
rpm -qi pckg_name # Show package metadata
rpm -i *.rpm      # Install RPM file 
rpm -e pckg_name  # Delete package 
rpm -ql pckg_name # List package files
rpm -qR pckg_name # Show package dependenies
```

## Build own package 
```bash
rpmdev-setuptree
rpmbuild --bb name.spec  # RPM build
rpmbuild --bs name.spec  # SRPM build
rpmbuild --ba name.spec  # RPM+SRPM build
```


## Lab making
``` bash
# Образ SRPM 
wget http://vault.centos.org/8.3.2011/AppStream/Source/SPackages/httpd-2.4.37-30.module_el8.3.0+561+97fdbbcc.src.rpm 

# Создание древа каталогов для сборки (DIR: /home/artem/rpmbuild):
rpm -i httpd-2.4.37-30.module_el8.3.0+561+97fdbbcc.src.rpm
