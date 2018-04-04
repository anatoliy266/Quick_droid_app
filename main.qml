import QtQuick 2.3
import QtQuick.Window 2.3
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4

Window {
    visible: true
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight
    MyButton {
        id: addButton1
        width: parent.width
        height: parent.height/6
        x: 0
        y: parent.height-parent.height/6+5
        text: "ADD"
        color: "#48b261"
        hoverColor: "#1e6531"
        onClicked: regUserDialog.open()
    }
    Dialog {

        id: regUserDialog
        contentItem: Rectangle {
            id: contentRect
            width: Screen.desktopAvailableWidth-Screen.desktopAvailableWidth/10
            height: Screen.desktopAvailableHeight/3
            Text {
                id: user
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Enter username")
            }
            Rectangle {
                id: textRect
                width: parent.width-parent.width/20
                height: parent.height/4
                x: parent.width/2-textRect.width/2
                y: user.height*2
                border {
                    color: "grey"
                    width: 2
                }
                TextInput {
                    id: userName
                    anchors.fill: parent
                    //onEditingFinished: GoB.getUsername(userName.text)
                }
            }
            MyButton {
                id: okB
                width: parent.width/2-1
                height: (parent.height-user.height*2-textRect.height)/2
                x: 0
                y: parent.height-okB.height
                text: "OK"
                border.color: "#48b261"
                releaseColor: "#48b261"
                hoverColor: "#1e6531"
                onClicked: GoB.getUsername(userName.text)
            }
            MyButton {
                id: cancelB
                width: parent.width/2-1
                height: (parent.height-user.height*2-textRect.height)/2
                x: parent.width/2+1
                y: parent.height-cancelB.height
                text: "Cancel"
                border.color: "#48b261"
                releaseColor: "#48b261"
                hoverColor: "#1e6531"
                onClicked: regUserDialog.close()
            }
        }
    }
    Connections {
        target: GoB
        onRecieveUsername: {
            userName.text = uRecived
        }
    }
}
