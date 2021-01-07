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


# При сборке вышли траблы
rpmbuild -bb /home/artem/rpmbuild/SPECS/httpd.spec 
error: Failed build dependencies:
	apr-devel >= 1.5.0 is needed by httpd-2.4.37-30.el8.x86_64
	apr-util-devel >= 1.5.0 is needed by httpd-2.4.37-30.el8.x86_64
	autoconf is needed by httpd-2.4.37-30.el8.x86_64
	brotli-devel is needed by httpd-2.4.37-30.el8.x86_64
	libselinux-devel is needed by httpd-2.4.37-30.el8.x86_64
	libxml2-devel is needed by httpd-2.4.37-30.el8.x86_64
	lua-devel is needed by httpd-2.4.37-30.el8.x86_64
	openssl-devel is needed by httpd-2.4.37-30.el8.x86_64
	pcre-devel >= 5.0 is needed by httpd-2.4.37-30.el8.x86_64
	perl-generators is needed by httpd-2.4.37-30.el8.x86_64
	systemd-devel is needed by httpd-2.4.37-30.el8.x86_64
	xmlto is needed by httpd-2.4.37-30.el8.x86_64
	zlib-devel is needed by httpd-2.4.37-30.el8.x86_64
```

## VIM
```
# Build the daemon
./configure \
        --prefix=%{_sysconfdir}/httpd \
        --exec-prefix=%{_prefix} \
        --bindir=%{_bindir} \
        --sbindir=%{_sbindir} \
        --mandir=%{_mandir} \
        --libdir=%{_libdir} \
        --sysconfdir=%{_sysconfdir}/httpd/conf \
        --includedir=%{_includedir}/httpd \
        --libexecdir=%{_libdir}/httpd/modules \
        --datadir=%{contentdir} \
        --enable-layout=Fedora \
        --with-installbuilddir=%{_libdir}/httpd/build \
        --enable-mpms-shared=all \
        --with-apr=%{_prefix} --with-apr-util=%{_prefix} \
        --enable-suexec --with-suexec \
        --enable-suexec-capabilities \
        --with-suexec-caller=%{suexec_caller} \
        --with-suexec-docroot=%{docroot} \
        --without-suexec-logfile \
        --with-suexec-syslog \
        --with-suexec-bin=%{_sbindir}/suexec \
        --with-suexec-uidmin=1000 --with-suexec-gidmin=1000 \
        --with-brotli \
        --enable-pie \
        --with-pcre \
        --enable-mods-shared=all \
        --enable-ssl --with-ssl --disable-distcache \
        --enable-proxy --enable-proxy-fdpass \
        --enable-cache \
        --enable-disk-cache \
        --enable-ldap --enable-authnz-ldap \
        --enable-cgid --enable-cgi \
        --enable-cgid-fdpassing \
        --enable-authn-anon --enable-authn-alias \
        --disable-imagemap --disable-file-cache \
        --disable-http2 \
        --disable-md \
        --with-openssl=/home/artem/openssl-1.1.1i \
        $*
make %{?_smp_mflags}


%install
rm -rf $RPM_BUILD_ROOT

make DESTDIR=$RPM_BUILD_ROOT install

# Install systemd service files
mkdir -p $RPM_BUILD_ROOT%{_unitdir}
for s in httpd.service htcacheclean.service httpd.socket \
         httpd@.service httpd-init.service; do
  install -p -m 644 $RPM_SOURCE_DIR/${s} \
                    $RPM_BUILD_ROOT%{_unitdir}/${s}
done
```
  
