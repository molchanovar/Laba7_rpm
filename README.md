# Laba7_rpm
soft distribution


1. Создан rpm пакет на примере простого Python приложения - календарь (выводит текущий месяц и дату) 
2. Создан репозиторий myApp.repo и туда помещено приложение 
3. Процесс автоматизирован через VagrantFile 


Для запуска скачать и распаковать zip архив Laba7_rpm, далее сделать Vagrant up / ssh 



Файлы:

<B>Calendar.py</B> - исходный код приложения "Календарь" 

<B>CreateRPM_script.sh</B> - скрипт создания rpm приложения и собственного репозитория 

<B>calendar.spec</B> - SPEC файл необходимый для создания rpm и srpm

<B>rpm_help.md</B> - важные команды из лекции 
