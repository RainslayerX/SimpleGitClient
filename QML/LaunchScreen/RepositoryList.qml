import QtQuick 2.0

ListView {
    id: repositoryList
    clip: true
    currentIndex: -1

    highlight: Rectangle {
        id: highlightSelector
        color: "transparent"
        border.color: "white"
        border.width: 2
        z: 5
    }

    model: repositoryNavigation.repositories
    delegate: Rectangle {
        width: 420
        height: 54
        color: "transparent"

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: parent.color = "#455A64"
            onExited: parent.color = "transparent"
            onPressed: parent.color = "#37474F"

            onClicked: {
                parent.color = "transparent"
                repositoryList.currentIndex = index

                intro.visible = false
                repoDetails.visible = true

                repoTitle.text = model.modelData.name
                repoUrl.text = model.modelData.url
            }
        }

        Text {
            y: 10
            text: model.modelData.name
            verticalAlignment: Text.AlignBottom
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
            font.pixelSize: 16
            color: "white"
        }

        Text {
            x: 4
            y: 30
            text: model.modelData.url
            anchors.leftMargin: 10
            font.pixelSize: 12
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.rightMargin: 10
            verticalAlignment: Text.AlignBottom
            color: "white"
        }
    }
}
