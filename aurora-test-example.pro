# Copyright (c) 2019-2020 Open Mobile Platform LLC.
TARGET = aurora-test-example

CONFIG += sailfishapp

SOURCES += src/aurora-test-example.cpp

DISTFILES += \
    qml/test.qml \
    qml/aurora-test-example.qml \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    qml/pages/SecondPage.qml \
    qml/pages/LoginPage.qml \
    rpm/aurora-test-example.spec \
    aurora-test-example.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

CONFIG += sailfishapp_i18n
