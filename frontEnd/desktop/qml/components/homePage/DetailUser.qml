import QtQuick 6
import QtQuick.Controls 6
import QtQuick.Controls.Material 2.15

Item{
    id: detailUserPopUp

    Rectangle{
        Text{
            id: textUser
            text: "Détail utilisateur"
            anchors.top: parent.top
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: "#ffffff"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 20
            anchors.topMargin: 20
        }

        // TEXT FIELD USERNAME
        Label{
            id: nameLabel
            width: 300
            text: qsTr("Nom")
            verticalAlignment: Text.AlignVCenter        
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.top: textUser.bottom
            anchors.topMargin: 60
            font.underline: true
            font.pixelSize: 16
        }
        TextField{
            id: name
            width: 300
            text: qsTr("Warner")
            selectByMouse: true
            placeholderText: qsTr("Nom")
            verticalAlignment: Text.AlignVCenter        
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: nameLabel.bottom
            // anchors.topMargin: 5
        }

        Label{
            id: loginLabel
            width: 300
            text: qsTr("Login")
            verticalAlignment: Text.AlignVCenter        
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.top: name.bottom
            anchors.topMargin: 30
            font.underline: true
            font.pixelSize: 16
        }
            // TEXT FIELD USERNAME
        TextField{
            id: login
            width: 300
            text: qsTr("Warner")
            selectByMouse: true
            placeholderText: qsTr("Login")
            verticalAlignment: Text.AlignVCenter        
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: loginLabel.bottom
            // anchors.topMargin: 5
        }


        // BUTTON LOGIN
        Button{
            id: buttonLogin
            width: 300
            text: qsTr("Modifier")
            anchors.top: login.bottom
            anchors.topMargin: 50       
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: backend.checkLogin(name.text, login.text, passwordField.text)
        }
    }

}