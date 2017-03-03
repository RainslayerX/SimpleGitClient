import QtQuick 2.4

Rectangle {
    id: item1
    width: 1000
    height: 500
    color: "white"

    FontLoader {
        id: fontAwesome
        source: "qrc:///Fonts/fontawesome-webfont.ttf"
    }

    Rectangle {
        id: rectangle
        width: 70
        color: "#263238"
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0

        NavigationList { }
    }

    RepositoryViewLoader {
        anchors.left: rectangle.right
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        anchors.leftMargin: 0
        anchors.right: parent.right
    }
}
