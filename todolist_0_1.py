help="""
help - инструкции по программе
add - добавить задачу в список дел 
(название задачи вводит пользователь вручную)
show - отобразить все задачи.
exit - выход из программы списка дел"""
today=[]
tomorrow=[]
other=[]
run=True
while run:
  command=input("Введите команду: ")
  if command=="help":
    print(help)
  elif command=="show":
    print("Сегодня: ")
    print(today)
    print("Завтра: ")
    print(tomorrow)
    print("Другие задачи: ")
    print(other)
  elif command=="add":
    date=input("Введите дату выполнения задачи (Сегодня, Завтра или иное): ")
    task=input("Введите новую задачу: ")
    if date=="Сегодня":
      today.append(task)
    elif date=="Завтра":
      tomorrow.append(task)
    else:
      other.append(task)
    print("Задача добавлена!")
  elif command=="exit":
    print("Спасибо за использование!")
    break
  else:
    print("Неверная команда!")
    break
print("До свидания!")
