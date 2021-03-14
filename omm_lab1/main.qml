import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    id: mainWindow
    width: 640
    height: 480
    visible: true
    title: qsTr("lab1")

    property int defMargins: 20
    property int defFontSize: 20

    StackView {
        id: stackView
        anchors.fill: parent

        initialItem: "MainWindowPage.qml"
    }

}
