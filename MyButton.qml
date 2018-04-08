import QtQuick 2.3
import QtQuick.Window 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 2.2

Rectangle {
    id: addButton
    property string text
    property string hoverColor: "#1e6531"
    property string releaseColor: "#48b261"
    signal clicked
    radius: 5
    color: "#48b261"
    Text {
        id: addUserText
        anchors.centerIn: parent
        text: addButton.text
    }

    MouseArea {
        anchors.fill: parent
        onClicked: addButton.clicked()
        onPressed: parent.color = addButton.hoverColor
        onReleased: parent.color = addButton.releaseColor
    }

}
