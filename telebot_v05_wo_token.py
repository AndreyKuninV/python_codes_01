import telebot
from random import choice
token=" "
name="Андрей"
salut="Ба! Знакомые все лица!"
bot=telebot.TeleBot(token)
RANDOM_TASKS=["Записаться на курсы", "Написать письмо", "Покормить кота", "Помыть машину"]
HELP="""
/help - список доступных команд
/add - добавление задачи
/show - отобразить все задачи на введенную дату (если несколько дат, ввод через пробел)
/exit - выход из программы списка дел
/random - добавление случайной задачи на сегодня"""
tasks={}
def add_todo(date,task):
  if date in tasks:
    tasks[date].append(task)
  else:
    tasks[date]=[]
    tasks[date].append(task)

@bot.message_handler(commands=["help"])
def help(message):
  bot.send_message(message.chat.id, HELP)

@bot.message_handler(commands=["add"])
def add(message):
    command=message.text.split(maxsplit=2)
    date=command[1].lower()
    task=command[2]
    if len(task)>=3:
        add_todo(date,task)
        text="Задача "+task+" добавлена на дату: "+date
    else:
        text="Задача малоинформативна (менее 3 симоволов) и не может быть добавлена! Введите повторно!"
    bot.send_message(message.chat.id, text)

@bot.message_handler(commands=["random"])
def random_add(message):
    date="cегодня"
    task=choice(RANDOM_TASKS)
    text="Задача "+task+" добавлена на дату: "+date
    add_todo(date,task)
    bot.send_message(message.chat.id, text)

@bot.message_handler(commands=["show","print"])
def show(message):
    text=" "
    command=message.text.split(" ")
    date=command[1]
    for date in command:
        if date in tasks:
            text=date.upper()+"\n"
            for task in tasks[date.lower()]:
                text=text+" [] "+ task + "\n"
        elif date=="/show":
            text="..."
        else:
            text="Задач на дату "+date.upper()+ " нет"

        bot.send_message(message.chat.id, text)
        date.lower()

@bot.message_handler(content_types=["text"])
def echo(message):
    string=message.text
    if name in string:
        answer=salut
    else:
        answer=message.text
