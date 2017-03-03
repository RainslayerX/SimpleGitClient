import QtQuick 2.2
import QtQuick.Dialogs 1.1

Item {
    property FileDialog fileDialog : innerFileDialog;

    FileDialog {
        id: innerFileDialog
        title: "Please choose a Git folder"
        folder: shortcuts.home
        selectFolder: true
        selectExisting: true
        onAccepted: {
            var succes = repositoryNavigation.AddRepository(fileDialog.fileUrl)
            if(!succes)
                messageDialog.visible = true
        }
    }

    MessageDialog {
        id: messageDialog
        title: "Error!"
        width: 300
        text: "The selected directory is not a valid git folder"
    }
}