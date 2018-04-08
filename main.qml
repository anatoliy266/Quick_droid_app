import QtQuick 2.3
import QtQuick.Window 2.3
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4

Window {
    id: mainWindow
    visible: true
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight
    property int count: 0

    onBeforeRendering: {
        GoB.userNameList()
        generalVallet.showed=false
    }

    Rectangle {
        id: userBlock
        anchors.fill: parent

        Rectangle {
        x: 0
        y: 0
        width: parent.width
        height: parent.height-parent.height/6+5
        ScrollView {
                anchors.fill: parent

                ListView {
                    id: userList
                    anchors.fill: parent
                    model: GmoD

                    delegate: ItemDelegate {
                        width: Screen.desktopAvailableWidth
                        height: 70

                        Rectangle {
                            id: swipeRect
                            width: parent.width
                            height: 70
                            color: "#3095b8ce"
                            border.color: "grey"

                            SwipeView {
                                id: swipeUserInfo
                                anchors.fill: parent

                                Page {
                                    width: Screen.desktopAvailableWidth
                                    height: 70
                                    Rectangle {
                                        id: userrPage
                                        anchors.fill: parent
                                        color: "#3095b8ce"

                                        Text {
                                            id: text1
                                            anchors.centerIn: parent
                                            font.pixelSize: 24
                                            text: qsTr(name)
                                            style: Text.Sunken
                                            font.family: "Verdana"
                                        }

                                        Rectangle {
                                            height: 1
                                            width: parent.width-parent.width/10
                                            anchors.bottom: parent.bottom
                                            anchors.horizontalCenter: parent.horizontalCenter
                                            color: "grey"
                                        }

                                        Rectangle {
                                            height: 1
                                            width: parent.width-parent.width/10
                                            anchors.top: parent.top
                                            anchors.horizontalCenter: parent.horizontalCenter
                                            color: "grey"
                                        }
                                    }
                                    MouseArea {
                                        width: swipeRect.width
                                        height: swipeRect.height
                                        x: swipeRect.x
                                        y: swipeRect.y
                                        onDoubleClicked: {
                                            userBlock.visible=false
                                            generalVallet.visible=true
                                            generalVallet._id=id
                                        }
                                        onPressed: {
                                            userrPage.color= "#30294c5f"
                                            valetPage.color= "#30294c5f"
                                        }
                                        onReleased: {
                                            userrPage.color= "#3095b8ce"
                                            valetPage.color= "#3095b8ce"
                                        }

                                    }
                                }

                                Page {

                                    width: Screen.desktopAvailableWidth
                                    height: 70

                                    Rectangle {
                                        id: valetPage
                                        anchors.fill: parent
                                        color: "#3095b8ce"

                                        Text {
                                            anchors.left: parent.left
                                            anchors.top: parent.top
                                            id: currentText
                                            font.pointSize: 20
                                            text: qsTr("Баланс:  ")
                                        }

                                        Text {
                                            anchors.top: parent.top
                                            anchors.left: currentText.right
                                            font.pointSize: 20
                                            text: cur
                                        }

                                        Rectangle {
                                            id: trashBox
                                            width: currentText.height*3/2
                                            height: currentText.height
                                            anchors.right: parent.right
                                            anchors.top: parent.top

                                            Image {
                                                id: trashIm
                                                anchors.fill: parent
                                                source: "assets:/images/menuB.jpg"
                                            }

                                            MouseArea {
                                                anchors.fill: parent
                                                onClicked: delDialog.open()
                                            }
                                        } 

                                        Dialog {
                                            id: delDialog
                                            contentItem: Rectangle {
                                                width: Screen.desktopAvailableWidth-Screen.desktopAvailableWidth/10
                                                height: Screen.desktopAvailableHeight/3
                                                Text {
                                                    id: delText
                                                    anchors.top: parent.top
                                                    width: parent.width
                                                    height: parent.height/2
                                                    text: qsTr("Вы действительно хотите удалить этого пользователя? После удаления информацию восстановить невозможно!")
                                                    wrapMode: Text.WordWrap
                                                }

                                                MyButton {
                                                    id: noB
                                                    width: okB.width
                                                    height: okB.height
                                                    anchors.bottom: parent.bottom
                                                    anchors.right: parent.right
                                                    text: "No"
                                                    border.color: "#48b261"
                                                    releaseColor: "#48b261"
                                                    hoverColor: "#1e6531"
                                                    onClicked: delDialog.close()
                                                }

                                                MyButton {
                                                    id: yesB
                                                    width: okB.width
                                                    height: okB.height
                                                    anchors.bottom: parent.bottom
                                                    anchors.left: parent.left
                                                    text: "Yes"
                                                    border.color: "#48b261"
                                                    releaseColor: "#48b261"
                                                    hoverColor: "#1e6531"
                                                    onClicked: {
                                                        GoB.delUser(id)
                                                        GoB.userNameList()
                                                        GmoD.updateModel()
                                                        delDialog.close()
                                                    }
                                                }
                                            }
                                        }



                                        Rectangle {
                                            height: 1
                                            width: parent.width-parent.width/10
                                            anchors.bottom: parent.bottom
                                            anchors.horizontalCenter: parent.horizontalCenter
                                            color: "grey"
                                        }

                                        Rectangle {
                                            height: 1
                                            width: parent.width-parent.width/10
                                            anchors.top: parent.top
                                            anchors.horizontalCenter: parent.horizontalCenter
                                            color: "grey"
                                        }

                                        Rectangle {
                                            id: free
                                            color: "green"
                                            width: (parent.width)/cur*(cur-spent)
                                            height: parent.height-currentText.height
                                            anchors.left: parent.left
                                            anchors.bottom: parent.bottom
                                            radius: 5

                                            Text {
                                                id: freeMoneyG
                                                anchors.centerIn: parent
                                                text: cur-spent
                                            }
                                        }

                                        Rectangle {
                                            id: off
                                            color: "red"
                                            width: (parent.width)/cur*spent
                                            height: parent.height-currentText.height
                                            anchors.left: free.right
                                            anchors.bottom: parent.bottom
                                            radius: 5

                                            Text {
                                                id: offMoneyG
                                                anchors.centerIn: parent
                                                text: spent
                                            }
                                        }
                                    }
                                    MouseArea {
                                        width: swipeRect.width-trashBox.width
                                        height: swipeRect.height
                                        x: swipeRect.x
                                        y: swipeRect.y
                                        onDoubleClicked: {
                                            userBlock.visible=false
                                            generalVallet.visible=true
                                            generalVallet._id=id
                                        }
                                        onPressed: {
                                            userrPage.color= "#30294c5f"
                                            valetPage.color= "#30294c5f"
                                        }
                                        onReleased: {
                                            userrPage.color= "#3095b8ce"
                                            valetPage.color= "#3095b8ce"
                                        }

                                    }
                                }
                            }
                        }
                    }
                }
            }
    }

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
                onClicked: {
                    GoB.getUsername(userName.text)
                    GoB.userNameList()
                    GmoD.updateModel()
                    regUserDialog.close()
                }
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
}

    Vallet {
        id: generalVallet
    }

    Connections {
        target: GoB
        onRecieveUsername: {

        }
        onRecieveCount: {
           mainWindow.count = count
        }
    }

        AnimatedImage {
            width: Screen.desktopAvailableWidth/10
            height: Screen.desktopAvailableWidth/10
            x: 0-bird.width
            y: addButton1.y-bird.width
            id: bird
            source: "assets:/images/birddd.gif"


            NumberAnimation {
                target: bird
                property: "x"
                duration: 5000
                from: bird.x
                to: Screen.desktopAvailableWidth+bird.width
                easing.type: Easing.OutSine
                running: true
                onStopped: {}
            }
        }
}
