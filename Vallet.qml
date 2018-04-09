import QtQuick 2.3
import QtQuick.Window 2.3
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import QtMultimedia 5.9

Rectangle {
    property int _id
    property bool showed
    width: parent.width
    height: parent.height
    visible: false

    Image {
        id: taskBIm
        anchors.top: parent.top
        source: "assets:/images/taskB.png"
    }

    Rectangle {
        id: valStat
        width: parent.width/5
        height: parent.height-taskBIm.height-5
        x: parent.width-parent.width/5-5
        y: taskBIm.height + 5
        color: "blue"
        radius: 5

        ListView {
            id: stat
        }
    }

    Rectangle {
        id: cameraB
        width: parent.width/5
        height: parent.width/5
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height-cameraB.height
        color: "green"

        MouseArea {
            anchors.fill: parent
            onClicked: {cameraView.visible = true}
        }
    }
}
