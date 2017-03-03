import QtQuick 2.7
import QtQuick.Window 2.2
import Controllers 1.0

Window {
    id: root
    visible: true
    width: 1180
    height: 620
    title: qsTr("Simple Git Client")

    ApplicationController { id: applicationController }

    Loader {
        id: pageLoader
        source: "LaunchScreen/MainForm.ui.qml"
        anchors.fill: parent
    }
}
