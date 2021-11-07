import QtQuick 2.15
import QtQuick.Controls 2.15
//import QtGraphicalEffects 1.15
import Qt5Compat.GraphicalEffects

Item {

    id: userItem
    property url iconSource: "../../../../images/svg_images/user.svg"
    property url imageSource: "../../../../images/watchdogs.jpg"
    property bool useImage: false
    Rectangle {
        id: container
        x: 46
        y: 16
        width: 476
        height: 61
        color: "#495163"

        Rectangle {
            id: avatar
            y: 0
            width: 50
            height: 50
            color: "#272b35"
            radius: 50
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 10

            Image{
                id: icon
                source: iconSource
                sourceSize.height: 26
                sourceSize.width: 26
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter

            }


            Image {
                id: image
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                fillMode: Image.PreserveAspectFit
                sourceSize.width: 50
                sourceSize.height: 50
                source: imageSource
                visible: useImage
                layer.enabled: true
//                layer.effect: OpacityMask{
//                    maskSource: parent
//                }
            }
        }
    }
}
