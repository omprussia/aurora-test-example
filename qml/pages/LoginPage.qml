// Copyright (c) 2019-2020 Open Mobile Platform LLC.
import QtQuick 2.0
import Sailfish.Silica 1.0

Dialog {
    id: dialog
    objectName: "TestLoginPage"
    allowedOrientations: Orientation.All

    canAccept: usernameField.text && passwordField.text

    SilicaFlickable {
        objectName: "TestLoginFlick"
        anchors.fill: parent

        contentHeight: column.height

        Column {
            id: column
            objectName: "TestLoginColumn"

            width: parent.width
            spacing: Theme.paddingLarge
            DialogHeader {
                objectName: "TestLoginPageHeader"
                title: qsTr("Login page")
                acceptText: qsTr("Sign in")
                cancelText: qsTr("Cancel")
            }

            TextField {
                id: usernameField
                objectName: "TestLoginUsernameField"
                width: parent.width
                placeholderText: qsTr("Username")
                label: placeholderText
                errorHighlight: !focus && !text
                focus: true
                EnterKey.iconSource: "image://theme/icon-m-enter-next"
                EnterKey.onClicked: {
                    if (text) {
                        passwordField.focus = true
                    }
                }
            }

            PasswordField {
                id: passwordField
                objectName: "TestLoginPasswordField"
                width: parent.width
                placeholderText: qsTr("Password")
                label: placeholderText
                errorHighlight: !focus && !text
                EnterKey.iconSource: "image://theme/icon-m-enter-accept"
                EnterKey.onClicked: {
                    if (!usernameField.text) {
                        usernameField.focus = true
                    } else if (text) {
                        dialog.accept()
                    } else {
                        focus = true
                    }
                }
            }
        }
    }
}
