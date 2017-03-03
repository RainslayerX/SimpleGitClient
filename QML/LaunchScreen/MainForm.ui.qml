import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3
import Controllers 1.0

Item {
    id: rootView
    width: 1000
    height: 500

    Rectangle {
        id: leftBar
        width: 450
        color: "#2b2b2b"
        transformOrigin: Item.Center
        border.color: "#00000000"
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0

        ColumnLayout {
            id: repositoryView
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 15
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.rightMargin: 15
            anchors.leftMargin: 15
            anchors.topMargin: 15
            spacing: 10

            Text {
                id: text1
                color: "#fafafa"
                text: qsTr("Simple Git Client")
                leftPadding: 0
                font.family: "Verdana"
                horizontalAlignment: Text.AlignLeft
                font.pixelSize: 12
            }

            RowLayout {
                id: flow2
                height: 28
                visible: true
                anchors.right: parent.right
                anchors.left: parent.left

                Text {
                    id: text2
                    x: 0
                    color: "#fafafa"
                    text: qsTr("Repositories")
                    leftPadding: -1
                    renderType: Text.QtRendering
                    font.pixelSize: 24
                }

                Button {
                    id: buttonAddRepo
                    width: 28
                    height: 28
                    text: qsTr("+")
                    Layout.maximumHeight: 28
                    Layout.maximumWidth: 28
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    onClicked: gitDirectorySelect.fileDialog.visible = true
                }
            }

            RepositoryList {
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }
    }

    Rectangle {
        id: mainView
        color: "#ffffff"
        anchors.left: leftBar.right
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        anchors.leftMargin: 0

        ColumnLayout {
            id: intro
            y: 0
            visible: true
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.top: parent.top
            anchors.leftMargin: 0

            Item {
                width: 200
                height: 200
                Layout.maximumHeight: 200
                Layout.maximumWidth: 433
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                Text {
                    id: title
                    text: qsTr("Simple Git Client")
                    font.weight: Font.ExtraLight
                    font.pixelSize: 36
                }

                Text {
                    id: textArea
                    text: qsTr("Welcome to my simple git program\nThe goal here is to have a simple and modern looking gui program for linux.\n\nUse the Navigation Bar on the left to add and use repositories.")
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    anchors.top: parent.top
                    anchors.topMargin: 80
                    rightPadding: 0
                    leftPadding: 0
                    bottomPadding: 0
                    topPadding: 0
                    wrapMode: Text.WordWrap
                    font.weight: Font.Light
                }

                Text {
                    id: title1
                    x: 0
                    y: 35
                    color: "#494949"
                    text: qsTr("Git Simplified For Linux")
                    font.pixelSize: 26
                    font.weight: Font.ExtraLight
                }
            }
        }

        ColumnLayout {
            id: repoDetails
            x: 0
            y: 8
            anchors.top: parent.top
            anchors.leftMargin: 0
            anchors.bottom: parent.bottom
            visible: false
            anchors.right: parent.right
            Item {
                id: item1
                width: 200
                height: 200
                Layout.maximumHeight: 300
                Layout.maximumWidth: 500
                Layout.fillWidth: true
                Text {
                    id: repoTitle
                    text: qsTr("RepositoryName")
                    font.pixelSize: 32
                    font.weight: Font.ExtraLight
                }

                Text {
                    id: repoUrl
                    x: 0
                    y: 35
                    color: "#494949"
                    text: qsTr("/home/pop")
                    font.pixelSize: 16
                    font.weight: Font.ExtraLight
                }

                Button {
                    id: settingsButton
                    width: 125
                    height: 30
                    text: qsTr("Settings")
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0
                }

                Button {
                    id: openButton
                    y: -6
                    width: 125
                    height: 30
                    text: qsTr("Open")
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0
                    onClicked: pageLoader.source = "/RepositoryMain/RepositoryMainForm.ui.qml"
                }

                Text {
                    id: repoUrl1
                    x: 5
                    y: 33
                    color: "#494949"
                    text: qsTr("*repoinfo*\n*blabla*\n*todo*")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 12
                    font.weight: Font.Light
                }
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.fillHeight: true
            }
            anchors.left: parent.left
        }
    }

    RepositoryNavigation {
        id: repositoryNavigation
    }

    GitDirectorySelect {
        id: gitDirectorySelect
    }
}
