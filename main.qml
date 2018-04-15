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

                Image {
                    id: cloudIm
                    source: "assets:/images/cloud.png"
                }

                ListView {
                    id: userList
                    anchors.fill: parent
                    model: GmoD

                    delegate: ItemDelegate {
                        width: Screen.desktopAvailableWidth-treeIm.width
                        height: 70
                        x: treeIm.width

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
                                    width: Screen.desktopAvailableWidth-treeIm.width
                                    height: 70
                                    Rectangle {
                                        id: userrPage
                                        anchors.fill: parent
                                        color: "#3095b8ce"
                                        antialiasing: true

                                        Text {
                                            id: text1
                                            anchors.centerIn: parent
                                            font.pixelSize: 20
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
                                            antialiasing: true
                                        }

                                        Rectangle {
                                            height: 1
                                            width: parent.width-parent.width/10
                                            anchors.top: parent.top
                                            anchors.horizontalCenter: parent.horizontalCenter
                                            color: "grey"
                                            antialiasing: true
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

                                    width: Screen.desktopAvailableWidth-treeIm.width
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
                                            font.pointSize: 16
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
                                                antialiasing: true
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
                                            antialiasing: true
                                        }

                                        Rectangle {
                                            height: 1
                                            width: parent.width-parent.width/10
                                            anchors.top: parent.top
                                            anchors.horizontalCenter: parent.horizontalCenter
                                            color: "grey"
                                            antialiasing: true
                                        }

                                        Rectangle {
                                            id: free
                                            color: "green"
                                            width: (parent.width)/cur*(cur-spent)
                                            height: parent.height-currentText.height
                                            anchors.left: parent.left
                                            anchors.bottom: parent.bottom
                                            radius: 5
                                            antialiasing: true

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
                                            antialiasing: true

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
        Image {
            id: treeIm
            width: Screen.desktopAvailableWidth/4
            height: Screen.desktopAvailableHeight-addButton1.height*2
            y: Screen.desktopAvailableHeight-addButton1.height-treeIm.height+10
            antialiasing: true
            source: "assets:/images/tower.png"
        }

        Image {
            id: torchIm
            width: treeIm.width/4
            height: treeIm.height/5
            anchors.bottom: parent.bottom
            x: 0+treeIm.width*3
            antialiasing: true
            source: "assets:/images/torch.png"
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

        Image {
            id: roadIm
            antialiasing: true
            anchors.top: parent.top
            width: parent.width
            height: parent.height/3
            source: "assets:/images/road.png"
        }
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
    AnimatedImage {
        width: Screen.desktopAvailableWidth/10
        height: Screen.desktopAvailableWidth/10
        x: 0-bird.width
        y: addButton1.y-treeIm.height/2
        id: bird
        antialiasing: true
        source: "assets:/images/birddd.gif"
    }

    AnimatedImage {
        width: Screen.desktopAvailableWidth/10
        height: Screen.desktopAvailableWidth/10
        x: 0-bird.width
        y: addButton1.y-treeIm.height
        id: bird1
        antialiasing: true
        source: "assets:/images/birdddR.gif"
    }

    AnimatedImage {
        width: Screen.desktopAvailableWidth/10
        height: Screen.desktopAvailableWidth/10
        x: 0-bird.width
        y: addButton1.y-treeIm.height/3*2
        id: bird2
        antialiasing: true
        source: "assets:/images/birdddR.gif"
    }

    NumberAnimation {
        id: flyingBird1
        target: bird
        property: "x"
        duration: 5000
        from: 0-bird.width
        to: Screen.desktopAvailableWidth+bird.width
        easing.type: Easing.OutSine
        running: true
        onStopped: seqAnim.running=true
    }

    ParallelAnimation {
        id: seqAnim

        NumberAnimation {
            id: flyingBird2
            target: bird1
            property: "x"
            duration: 6000
            from: Screen.desktopAvailableWidth+bird.width+100
            to: 0-bird.width
            easing.type: Easing.OutSine
        }

        NumberAnimation {
            id: flyingBird3
            target: bird2
            property: "x"
            duration: 5000
            from: Screen.desktopAvailableWidth+bird.width
            to: 0-bird.width
            easing.type: Easing.OutSine
        }
        onStopped: flyingBird1.running=true
    }
}

    Vallet {
        id: generalVallet
    }

    CameraView {
        id: cameraView
        visible: false
    }

    Connections {
        target: GoB
        onRecieveUsername: {

        }
        onRecieveCount: {
           mainWindow.count = count
        }
    }


}
