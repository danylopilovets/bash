HW 1:
Дан файл csv файл с юзерами. Первая колонка имя юзера, вторая отдел.
Задача, написать Bash-скрипт:
---
• Который принимает именованный аргумент --filename.
• Скрипт закончит выполнение, если любая из команд вернула ошибку.
• Если файл без префикса csv, скрипт должен вернуть ошибку.
• Скрипт должен создать юзера с рандомным паролем.
• Скрипт должен создать группу, если уже существует, скрипт не должен выполниться с ошибкой.
• Добавить юзеров в соответствующие группы.
После создания юзера и добавления его в группу вывести на stdout [INFO]:
• <dd::mm:y:HH:MM> <username> was created and add to following group <group_names>
