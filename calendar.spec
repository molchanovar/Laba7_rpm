#SPEC file

Name:       SimpleCalendar
Version:    1.00
Release:    1.01
Summary:    SimpleCalendar in  RPM package
License:    Nothing

%description
Superlight and simple Calendar application, writing on python3

%prep

%build
cat > Calendar.py <<EOF
#!/usr/bin/python3
import calendar
from datetime import date

#Текущая дата 
current_date=date.today()

#Вывод даты и календаря
print (calendar.month(current_date.year, current_date.month))
print("Today is: %d-%d-%d" % (current_date.day, current_date.month, current_date.year))
EOF

%install
mkdir -p %{buildroot}/usr/bin/
install -m 755 Calendar.py %{buildroot}/usr/bin/Calendar.py

%files
/usr/bin/Calendar.py

%changelog
# let's skip this for now

