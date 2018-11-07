# Example application with Appium test for Aurora OS and Sailfish OS

## Prepare

Build and install rpm package to device. Test will launch application automatically.

Test is running on desktop PC. Please adjust appium/test.py contents to match your mobile device ip address.

To run test you must install Appium python module (https://github.com/appium/python-client), install `qapreload` library to mobile device, and start `appium-aurora` docker container with Appium Aurora Driver

## Run

```
python3 appium/test.py
```
