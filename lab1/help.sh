 #!/bin/bash
key=$1
case $key in
calc)
echo -e "Аргументы:\n[sum] [num1] [num2] - выводит сумму двух чисел\n[sub] [num1] [num2] - выводит разность двух чисел\n[mul] [num1] [num2] - выводит произведение двух чисел\n[div] [num1] [num2] - выводит частное двух чисел"
;;
search)
echo -e "Аргументы:\n[directory] [pattern]\nПроизводит рекурсивный поиск по содержимому файло в директории и выводит строкив соотсветствии с регулярным выражением"
;;
reverse)
echo -e "Аргументы:\n[input file] [output file]\nЗаписывает содержимое файла в обратном порядке"
;;
strlen)
echo -e "Аргументы:\n[string]\nВыводит длину строки"
;;
log)
echo -e "Выводит отредактированное содержимое /var/log/anaconda/X.log"
;;
exit)
echo -e "Аргументы:\n[code]\nЗавершает работу с заданным кодом возврата(по дефолту 0)"
;;
*)
echo -e "Как использовать: ./main.sh [ключ] [аргументы...]\n\nКлючи:\ncalc\tsearch\treverse\nstrlen\tlog\texit\n"
echo -e "Для подробной информации по ключам и их аргументам пишите: ./main.sh help [key]\n"
echo -e "Коды ошибок:\n1 - неправильный или пустой аргумент\n2 - деление на 0\n3 - аргумент не число\n4 - папка не найдена\n5 - нет прав на чтение\n6 - нет прав на запись"
;;
esac
exit 0
