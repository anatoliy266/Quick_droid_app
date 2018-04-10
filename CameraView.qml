import QtQuick 2.3
import QtQuick.Window 2.3
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import QtMultimedia 5.9
//import ChekScan 1.0

Rectangle {
    id: cameraArea
    anchors.fill: parent
    visible: false

    VideoOutput {
        anchors.fill: parent
        focus: visible
        source: camera
    }

    Image {
            id: photoPreview
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
        }

    Camera {
            id: camera
            imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceFlash
            captureMode: Camera.CaptureStillImage

            exposure {
                exposureCompensation: -1.0
                exposureMode: Camera.ExposureAuto
                //iso: 3200
            }

            flash.mode: Camera.FlashRedEyeReduction

            imageCapture {
                onImageCaptured: {
                    photoPreview.source = preview
                    //chekScan.getChek(preview)
                }
            }
    }

    MouseArea{
        width: parent.width-closeB.width
        height: parent.height-closeB.height
        y: closeB.height
        onClicked: {
            camera.imageCapture.capture();
        }
    }

    Rectangle {
        id: closeB
        width: parent.width/10
        height: parent.height/10
        anchors.top: parent.top
        anchors.right: parent.right
        color: "red"

        MouseArea {
            onClicked: cameraArea.visible=false
        }
    }
}
