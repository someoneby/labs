import QtQuick 2.0
import QtQuick.Controls 2.12

Page {
    id: mainWindowPage
    anchors.fill: parent

    Column {
        id: bodySizeCol

        Text {
            text: "Размер тела (м^3)"
            font.pixelSize: defFontSize
        }

        TextField {
            id: bodySize
            placeholderText: "0"
        }
        anchors.top: parent.top
        anchors.right: materialCol.left
        anchors.margins: defMargins
    }

    Column {
        id: speedCol

        Text {
            text: "Cкорость старта (м/с)"
            font.pixelSize: defFontSize
        }

        TextField {
            id: speed
            placeholderText: "0"
        }
        anchors.top: bodySizeCol.bottom
        anchors.right: materialCol.left
        anchors.margins: defMargins
    }

    Column {
        id: materialCol

        Text {
            text: "Материал"
            font.pixelSize: defFontSize
        }

        ComboBox {
            id: material
            width: bodySize.width
            model: ["Стекло", "Камень", "Железо"]
        }
        anchors.top: parent.top
        anchors.left: parent.horizontalCenter
        anchors.margins: defMargins
    }

    Column {
        id: inclineCol

        Text {
            text: "Угол вылета (°)"
            font.pixelSize: defFontSize
        }

        TextField {
            id: incline
            placeholderText: "0"
        }

        anchors.top: materialCol.bottom
        anchors.left: parent.horizontalCenter
        anchors.margins: defMargins
    }

    Button {
        id: calculateButt
        text: "Рассчёт"

        anchors.top: inclineCol.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: defMargins

        onClicked: {
            stackView.push("TrajectoryPage.qml")
            appEngine.receiveData();
        }
    }

}
