import QtQuick 6
import QtQuick.Window 2.15
import QtQuick.Controls 6
import QtQuick.Controls.Material 2.15
import "components/controls"
import "components/app"

ApplicationWindow{
    id: window 
    width: 1000
    height: 600
    
    minimumWidth: 800
    minimumHeight: 500
    visible: true
    title: qsTr("App Home")

    // SET MATERIAL STYLE
    Material.theme: Material.Dark
    Material.accent: Material.LightBlue

    // CUSTOM PROPERTIES
    property string textUsername: "User"
    property string textPassword: "Pass"

    // // Labels
    // // USER
    // Text{
    //     id: textUser
    //     text: textUsername
    //     anchors.verticalCenter: parent.verticalCenter
    //     horizontalAlignment: Text.AlignHCenter
    //     verticalAlignment: Text.AlignVCenter
    //     color: "#ffffff"
    //     anchors.horizontalCenter: parent.horizontalCenter
    //     font.pointSize: 10
    // }

    // // PASSWORD
    // Text{
    //     id: textPass
    //     text: textPassword
    //     anchors.verticalCenter: parent.verticalCenter
    //     horizontalAlignment: Text.AlignHCenter
    //     anchors.margins: 10
    //     anchors.top: textUser.bottom
    //     anchors.topMargin: 20
    //     color: "#ffffff"
    //     anchors.horizontalCenter: parent.horizontalCenter
    //     font.pointSize: 10
    // }

    Rectangle {
        id: bg
        color: "#2c313c"
        border.color: "#383e4c"
        border.width: 1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: windowMargin
        anchors.leftMargin: windowMargin
        anchors.bottomMargin: windowMargin
        anchors.topMargin: windowMargin
        z: 1

        Rectangle {
            id: appContainer
            color: "#00000000"
            anchors.fill: parent
            anchors.rightMargin: 1
            anchors.leftMargin: 1
            anchors.bottomMargin: 1
            anchors.topMargin: 1

            TopBar{
                id: topBar
                height: 60
                color: "#1c1d20"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0
            }


            Rectangle {
                id: content
                color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: topBar.bottom
                anchors.bottom: parent.bottom
                anchors.topMargin: 0

                LeftMenu {
                    id: leftMenu
                    width: 70
                    color: "#1c1d20"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    clip: true
                    anchors.topMargin: 0
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 0
                }
            }
        }
    }
}
