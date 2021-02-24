net start > services.txt
net stop dnscache
timeout /t 15
net start > new_services.txt
comp services.txt new_services.txt > diff.txt
net start dnscache