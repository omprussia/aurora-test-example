// Copyright (c) 2019-2020 Open Mobile Platform LLC.
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    objectName: "TestSecondPage"

    allowedOrientations: Orientation.All

    Timer {
        id: testTimer
        interval: 1000
        repeat: true
        onTriggered: {
            listModel.append({
                name: qsTr("Item element: %1").arg(listModel.count)
            })
        }
    }

    SilicaListView {
        objectName: "TestSecondView"
        id: view
        anchors.fill: parent

        PullDownMenu {
            MenuItem {
                text: qsTr("Pull item one")
                onClicked: console.log("%1 clicked".arg(text))
            }
            MenuItem {
                text: qsTr("Clear model")
                onClicked: {
                    console.log("%1 clicked".arg(text))
                    listModel.clear()
                }
            }
            MenuItem {
                text: testTimer.running ? qsTr("Stop populating model")
                                        : qsTr("Start populating model")
                onClicked: {
                    console.log("%1 clicked".arg(text))
                    if (testTimer.running) {
                        testTimer.stop()
                    } else {
                        testTimer.start()
                    }

                }
            }
        }

        PushUpMenu {
            MenuItem {
                text: qsTr("Push item one")
                onClicked: console.log("%1 clicked".arg(text))
            }
            MenuItem {
                text: qsTr("Push item two")
                onClicked: console.log("%1 clicked".arg(text))
            }
            MenuItem {
                text: qsTr("Push item three")
                onClicked: console.log("%1 clicked".arg(text))
            }
            MenuItem {
                text: qsTr("Push item four")
                onClicked: console.log("%1 clicked".arg(text))
            }
        }

        header: PageHeader {
            objectName: "TestSecondPageHeader"
            title: qsTr("Page with model. Count: %1".arg(view.count))
        }

        model: ListModel {
            id: listModel
        }

        delegate: ListItem {
            id: listDelegate
            objectName: "TestSecondView%1Delegate".arg(index)
            contentHeight: Theme.itemSizeSmall
            menu: listItemMenu
            ListView.onRemove: animateRemoval(listDelegate)

            function remove(index) {
                listDelegate.remorseAction(qsTr("Deleting"), function() {
                    listModel.remove(index)
                })
            }

            Label {
                id: innerLabel
                objectName: "TestSecondView%1Name".arg(index)
                x: Theme.horizontalPageMargin
                anchors.verticalCenter: parent.verticalCenter
                text: model.name
            }

            Component {
                id: listItemMenu
                ContextMenu {
                    MenuItem {
                        text: qsTr("Context item one")
                        onClicked: console.log("%1 clicked".arg(text))
                    }
                    MenuItem {
                        text: qsTr("Context item two")
                        onClicked: console.log("%1 clicked".arg(text))
                    }
                    MenuItem {
                        text: qsTr("Remove item")
                        onClicked: {
                            onClicked: console.log("%1 clicked".arg(text))
                            listDelegate.remove(index)
                        }
                    }
                }
            }
        }

        ViewPlaceholder {
            objectName: "TestSecondViewPlaceholder"
            enabled: view.count == 0
            text: qsTr("No items yet")
            hintText: qsTr("Pull down to add items")
        }

        VerticalScrollDecorator {}
    }
}
