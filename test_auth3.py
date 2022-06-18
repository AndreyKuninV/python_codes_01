from selenium import webdriver
import time
from selenium.webdriver import Chrome
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
driver = webdriver.Chrome()
options = Options()
def test_recovery_pwd():
    text_com_incl = 0
    driver.get("https://bumbleby.ru")
    driver.set_window_size(1200, 700)
    time.sleep(2)
    recovery_href = driver.find_element(By.LINK_TEXT, "Забыли пароль?")
    recovery_href.click()
    time.sleep(2)
    mail_input = driver.find_element(By.TAG_NAME, "INPUT")
    mail_input.send_keys("a-kunin@yandex.ru")
    submit_btn = driver.find_element(By.TAG_NAME, "BUTTON")
    submit_btn.click()
    time.sleep(2)
    comment_text = driver.find_element(By.CSS_SELECTOR, "div.description")
    text_com = comment_text.text
    is_comment_text = comment_text.is_displayed()
    assert is_comment_text == True
    fullstring = text_com
    substring = "На указанную почту было отправлены инструкции"
    if fullstring.find(substring) != -1:
        text_com_incl = 1
    else:
        text_com_incl = 0
    assert text_com_incl == 1
    understand_btn = driver.find_element(By.LINK_TEXT, "Понятно")
    understand_btn.click()    
    # cancel_href = driver.find_element(By.CSS_SELECTOR, "a.btn.empty")
    # cancel_href.click()
    time.sleep(5)
    driver.close()
