import QtQuick 2.3
import QtQuick.Window 2.3
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4

Rectangle {
    property int _id
    property bool showed
    width: parent.width-5
    height: parent.height-10
    x: 5
    y: 5
    visible: false

    Rectangle {
        id: scrollRect
        width: (parent.width-parent.width/5)-5
        height: parent.height

        ScrollView {
            anchors.fill: parent

            Rectangle {
                id: cont
                width: parent.width-5
                height: parent.height/4
                color: "green"
                radius: 4
            }

            Rectangle {
                id: cont1
                width: parent.width-5
                height: parent.height/4
                x: cont.x
                y: cont.height+5

                color: "green"
                radius: 4
            }
        }
    }

    Rectangle {
        width: parent.width/5
        height: parent.height
        x: cont.width+5
        color: "blue"
        radius: 4

        ListView {
            id:valletStat
        }
    }
}
