from selenium import webdriver
import time
from selenium.webdriver import Chrome
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
driver = webdriver.Chrome()
options = Options()
def test_open_site():
    driver.get("https://bumbleby.ru")
    driver.set_window_size(1200, 700)
    time.sleep(2)
    recovery_href = driver.find_element(By.LINK_TEXT, "Забыли пароль?")
    recovery_href.click()
    time.sleep(2)
    cancel_href = driver.find_element(By.CSS_SELECTOR, "a.btn.empty")
    cancel_href.click()
    time.sleep(5)
    driver.close()
