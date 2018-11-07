// Copyright (c) 2019-2020 Open Mobile Platform LLC.
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    objectName: "TestFirstPage"

    allowedOrientations: Orientation.All

    SilicaFlickable {
        objectName: "TestFirstFlick"
        anchors.fill: parent

        PullDownMenu {
            MenuItem {
                text: qsTr("Attach second page")
                onClicked: {
                    pageStack.pushAttached(Qt.resolvedUrl("SecondPage.qml"))
                }
            }
        }

        contentHeight: column.height

        Column {
            id: column
            objectName: "TestFirstColumn"

            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                objectName: "TestFirstPageHeader"
                title: qsTr("Test app template")
            }
            Label {
                objectName: "TestFirstLabel"
                x: Theme.horizontalPageMargin
                text: qsTr("Hello Sailors")
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }

            TextSwitch {
                id: textSwitch
                objectName: "TestFirstSwitch"
                text: qsTr("Show login button")
                width: parent.width
            }

            Button {
                objectName: "TestFirstButton"
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Login")
                visible: textSwitch.checked
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("LoginPage.qml"))
                }
            }
        }
    }
}
