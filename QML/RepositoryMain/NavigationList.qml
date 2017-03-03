import QtQuick 2.0

ListView {
    id: navigationList
    x: 0
    y: 0
    width: parent.width
    height: parent.height

    currentIndex: 1

    highlight: Rectangle {
        id: highlightSelector
        color: "#455A64"
    }

    delegate: Text {
        font.family: fontAwesome.name
        color: "#FFFFFF"
        font.pixelSize: 20
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        width: 70
        height: 55
        text: name

        MouseArea {
            hoverEnabled: true
            anchors.fill: parent
            onEntered: parent.color = "#B0BEC5"
            onExited: parent.color = "#FFFFFF"
            onPressed: parent.color = "#607D8B"
            onReleased: parent.color = "#B0BEC5"
            onClicked: navigationList.currentIndex = index
        }
    }

    model: ListModel {
        ListElement {
            name: "\uf060"
        }

        ListElement {
            name: "\uf1da"
        }

        ListElement {
            name: "\uf15b"
        }

        ListElement {
            name: "\uf013"
        }
    }
}
