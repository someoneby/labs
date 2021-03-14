import QtQuick 2.0
import QtQuick.Controls 2.12

Page {
    id: trajectoryPage
    anchors.fill: parent

    Button {
        id: backButton
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.margins: defMargins

        text: "Назад"

        onClicked: {
            stackView.pop()
        }
    }

    Text {
        id: speedText
        anchors.top: parent.top
        anchors.right: parent.horizontalCenter
        anchors.margins: defMargins

        text: "Скорость: " + speedL + "(м/с)"
        font.pixelSize: defFontSize
    }

    Text {
        id: lengthText
        anchors.top: speedText.bottom
        anchors.right: parent.horizontalCenter
        anchors.margins: defMargins

        text: "Длина: " + trajectory.height + "(м)"
        font.pixelSize: defFontSize
    }

    Text {
        id: timeText
        anchors.top: parent.top
        anchors.left: parent.horizontalCenter
        anchors.margins: defMargins

        text: "Время: " + trajectory.height + "(c)"
        font.pixelSize: defFontSize
    }

    Text {
        id: heightText
        anchors.top: timeText.bottom
        anchors.left: parent.horizontalCenter
        anchors.margins: defMargins

        text: "Высота: " + trajectory.height + "(м)"
        font.pixelSize: defFontSize
    }

    Canvas {
        id: trajectory
        width: 400
        height: 400
        anchors.horizontalCenter: parent.horizontalCenter

        property int lastX: 0
        property int lastY: 400

        onPaint: {
            var ctx = getContext('2d');
            ctx.lineWidth = 2;
            ctx.beginPath();
            ctx.moveTo(lastX, lastY);

            var height = 850;
            var length = 150;

            if(length > height) {
                ctx.beginPath();
                var heightPoint = trajectory.height - (height / length) * trajectory.height;
                var middleX = lastX + trajectory.width / 2
                var endX = lastX + 400

                ctx.bezierCurveTo(lastX, lastY, middleX, heightPoint, endX, lastY);
                ctx.stroke();
            }
            else {
                var heightPoint = 0;
                var middleX = 200;
                var endX = middleX + (length / height) * trajectory.width / 2;
                var lastX = middleX - (length / height) * trajectory.width / 2;
                ctx.beginPath();

                ctx.bezierCurveTo(lastX, lastY, middleX, heightPoint, endX, lastY);
                ctx.stroke();
            }
        }
    }

    Connections {
        target: appEngine

        onSendResults: {
           speedL = 23
        }
    }

    property double speedL;


}
