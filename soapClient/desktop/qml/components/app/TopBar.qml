import QtQuick 6
import QtQuick.Controls 6
import "../controls"

Rectangle {
    id: topBar
    height: 60
    color: "#1c1d20"
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    anchors.rightMargin: 0
    anchors.leftMargin: 0
    anchors.topMargin: 0

    ToggleButton {
        onClicked: animationMenu.running = true
    }

    Rectangle {
        id: topBarDescription
        y: 28
        height: 25
        color: "#282c34"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.leftMargin: 70
        anchors.bottomMargin: 0

        Label {
            id: labelTopInfo
            color: "#5f6a82"
            text: qsTr("Application description")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            verticalAlignment: Text.AlignVCenter
            anchors.bottomMargin: 0
            anchors.rightMargin: 300
            anchors.topMargin: 0
            anchors.leftMargin: 10
        }

        Label {
            id: labelRightInfo
            color: "#5f6a82"
            text: qsTr("| HOME")
            anchors.left: labelTopInfo.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
            anchors.topMargin: 0
            anchors.rightMargin: 10
            anchors.leftMargin: 0
            anchors.bottomMargin: 0
        }
    }

    Rectangle {
        id: titleBar
        height: 35
        color: "#00000000"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 105
        anchors.leftMargin: 70
        anchors.topMargin: 0


        Image {
            id: iconApp
            width: 22
            height: 22
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "../../../images/svg_images/icon_app_top.svg"
            anchors.bottomMargin: 0
            anchors.leftMargin: 5
            anchors.topMargin: 0
            fillMode: Image.PreserveAspectFit
        }

        Label {
            id: label
            color: "#c3cbdd"
            text: qsTr("My Application Title")
            anchors.left: iconApp.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 10
            anchors.leftMargin: 5
        }
    }  
}