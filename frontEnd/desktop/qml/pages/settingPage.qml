import QtQuick 6
import QtQuick.Controls 6
import QtQuick.Controls.Material 2.15
import "../components/controls"

Item {
    // Text{
    //     id: textUser
    //     text: "setting page"
    //     anchors.verticalCenter: parent.verticalCenter
    //     horizontalAlignment: Text.AlignHCenter
    //     verticalAlignment: Text.AlignVCenter
    //     color: "#ffffff"
    //     anchors.horizontalCenter: parent.horizontalCenter
    //     font.pointSize: 10
    // }

        // BUTTON LOGIN
    Button{
        id: logout
        width: 300
        text: qsTr("Se déconnecter")
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        background: Rectangle{
            color: "#8c1108"
        }
        // onClicked: backend.checkLogin(name.text, login.text, passwordField.text)
    }
}