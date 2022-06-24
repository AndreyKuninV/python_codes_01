import telebot
token="_"
name="Андрей"
salut="Ба! Знакомые все лица!"
bot=telebot.TeleBot(token)
@bot.message_handler(content_types=["text"])
def echo(message):
    string=message.text
    if name in string:
        answer=salut
    else:
        answer=message.text
    bot.send_message(message.chat.id, answer)
bot.polling(none_stop=True)
