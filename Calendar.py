#!/usr/bin/python3

import calendar
from datetime import date

current_date=date.today()

print(calendar.month(current_date.year, current_date.month))
print("Today is: %d-%d-%d" % (current_date.day, current_date.month, current_date.year))
