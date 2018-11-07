#!/usr/bin/env python3

from appium import webdriver
from appium.webdriver.common.touch_action import TouchAction
from appium.webdriver.common.multi_action import MultiAction
import time
import sys

def get_driver(device = '192.168.1.248', app = '/usr/bin/aurora-test-example', auto_launch = True):
    appium_socket = 'http://localhost:4723/wd/hub'
    data = {
        'platformName': 'Aurora',
        'appPackage': app,
        'deviceName': device,
        'autoLaunch': auto_launch,
    }
    return webdriver.Remote(appium_socket, data)

driver = get_driver()

first_page = driver.find_element("objectName", "TestFirstPage")
first_switch = first_page.find_element("objectName", "TestFirstSwitch")
if not first_switch.get_property("checked"):
    first_switch.click()

test_button = driver.find_element("objectName", "TestFirstButton")
test_button.click()
driver.execute_script("app:waitForPageChange")

username_field = driver.find_element("objectName", "TestLoginUsernameField")
username_field.click()
username_field.send_keys("admin")

password_field = driver.find_element("objectName", "TestLoginPasswordField")
password_field.click()
password_field.send_keys("god")

driver.execute_script("app:goForward")
driver.execute_script("app:waitForPageChange")

time.sleep(1)

have_attached = first_page.get_property("forwardNavigation")
print(have_attached)
if not have_attached:
    driver.execute_script("app:pullDownTo", 0)

time.sleep(1)
driver.execute_script("app:goForward")
driver.execute_script("app:waitForPageChange")

test_view = driver.find_element("objectName", "TestSecondView")

driver.execute_script("app:pullDownTo", 2)
driver.execute_script("app:waitForPropertyChange", test_view.id, "count", 20, 22000)
driver.execute_script("app:pullDownTo", 2)

delegate_5 = driver.find_element("objectName", "TestSecondView5Delegate")
driver.execute_script("app:clickContextMenuItem", delegate_5.id, 1)
time.sleep(1)

delegate_13 = driver.find_element("objectName", "TestSecondView13Delegate")
driver.execute_script("app:scrollToItem", delegate_13.id)
driver.execute_script("app:clickContextMenuItem", delegate_13.id, 2)
time.sleep(6)

driver.execute_script("app:pullDownTo", 1)
time.sleep(1)

driver.execute_script("app:goBack")
driver.execute_script("app:waitForPageChange")

time.sleep(2)

driver.quit()