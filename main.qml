import QtQuick 2.3
import QtQuick.Window 2.3
import QtQuick.Controls 2.2

Window {
    visible: true
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight
    MyButton {
        antialiasing: true
        width: parent.width
        height: parent.height/7
        x: 0
        y: parent.height-parent.height/7+10
    }



}
