# Laba7_rpm
soft distribution


1. Создан rpm пакет на примере простого Python приложения - <B>Календарь</B> (выводит текущий месяц и дату, пример выполнения ниже) 
2. Создан репозиторий myApp.repo и туда помещено приложение 
3. Процесс автоматизирован через VagrantFile 


Для запуска скачать и распаковать zip архив Laba7_rpm, далее сделать Vagrant up / ssh 

```
vagrant up
...
    distribution: + cd /root/rpmbuild/BUILD
    distribution: + /usr/bin/rm -rf /root/rpmbuild/BUILDROOT/SimpleCalendar-1.00-1.01.x86_64
    distribution: + exit 0
...
    distribution: /home/vagrant/rpmbuild
    distribution: ├── SPECS
    distribution: │   └── calendar.spec
...

vagrant ssh

[root@distribution vagrant]# Calendar.py 
    January 2021
Mo Tu We Th Fr Sa Su
             1  2  3
 4  5  6  7  8  9 10
11 12 13 14 15 16 17
18 19 20 21 22 23 24
25 26 27 28 29 30 31

Today is: 10-1-2021
```

Файлы:

<B>Calendar.py</B> - исходный код приложения "Календарь" 

<B>CreateRPM_script.sh</B> - скрипт создания rpm приложения и собственного репозитория 

<B>calendar.spec</B> - SPEC файл необходимый для создания rpm и srpm

<B>rpm_help.md</B> - важные команды из лекции 
