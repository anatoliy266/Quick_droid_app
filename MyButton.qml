import QtQuick 2.3
import QtQuick.Window 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 2.2

Rectangle {
    id: addButton
    property string text
    signal clicked
    color: "red"
    radius: 5
    Text {
        id: addUserText
        anchors.centerIn: parent
        text: addButton.text
    }
    MouseArea {
        anchors.fill: parent
        onClicked: addButton.clicked()
        onPressed: parent.color = "green"
        onReleased: parent.color = "red"
    }

}
