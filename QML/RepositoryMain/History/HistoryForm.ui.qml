import QtQuick 2.4

Rectangle {
    id: rectangle
    width: 1000
    height: 400
    color: "white"

    ListView {
        id: listView
        x: 0
        width: 350
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: rectangle1.bottom
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        delegate: Item {
            x: 5
            width: 80
            height: 40
            Row {
                id: row1
                Rectangle {
                    width: 40
                    height: 40
                    color: colorCode
                }

                Text {
                    text: name
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }
                spacing: 10
            }
        }
        model: ListModel {
            ListElement {
                name: "Grey"
                colorCode: "grey"
            }

            ListElement {
                name: "Red"
                colorCode: "red"
            }

            ListElement {
                name: "Blue"
                colorCode: "blue"
            }

            ListElement {
                name: "Green"
                colorCode: "green"
            }
        }
    }

    ListView {
        id: listView1
        x: 2
        y: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: listView.right
        anchors.topMargin: 0
        delegate: Item {
            x: 5
            width: 80
            height: 40
            Row {
                id: row2
                Rectangle {
                    width: 40
                    height: 40
                    color: colorCode
                }

                Text {
                    text: name
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }
                spacing: 10
            }
        }
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        model: ListModel {
            ListElement {
                name: "Grey"
                colorCode: "grey"
            }

            ListElement {
                name: "Red"
                colorCode: "red"
            }

            ListElement {
                name: "Blue"
                colorCode: "blue"
            }

            ListElement {
                name: "Green"
                colorCode: "green"
            }
        }
        anchors.top: rectangle1.bottom
        anchors.leftMargin: 0
    }

    Rectangle {
        id: rectangle1
        height: 100
        color: "#37474f"
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top

        Text {
            id: text2
            x: 20
            y: 70
            color: "#cfd8dc"
            text: qsTr("Repository Name")
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 22
            font.weight: Font.Light
            font.pixelSize: 16
            font.family: "Roboto"
        }

        Text {
            id: text1
            x: 19
            y: 20
            color: "#ffffff"
            text: qsTr("History")
            anchors.top: parent.top
            anchors.topMargin: 22
            font.weight: Font.Light
            font.family: "Roboto"
            font.pixelSize: 32
        }
    }
}
