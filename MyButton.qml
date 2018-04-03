import QtQuick 2.3
import QtQuick.Window 2.3

    Rectangle {
        color: "red"
        radius: 10
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            id: addText
            text: qsTr("ADD")
        }
    }
