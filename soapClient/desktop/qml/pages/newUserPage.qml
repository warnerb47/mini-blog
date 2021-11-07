import QtQuick 6
import QtQuick.Controls 6
import QtQuick.Controls.Material 2.15
import "../components/controls"

Item {
    Text{
        id: textUser
        text: "Nouveau utilisateur"
        anchors.top: parent.top
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: "#ffffff"
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 20
        anchors.topMargin: 50
    }

        // IMAGE IMPORT
    // Image{
    //     id: image 
    //     width: 300
    //     height: 120
    //     source: "../../images/logo.png"        
    //     anchors.horizontalCenter: parent.horizontalCenter
    //     anchors.top: topBar.bottom
    //     anchors.topMargin: 60
    // }

    // TEXT FIELD USERNAME
    TextField{
        id: name
        width: 300
        text: qsTr("")
        selectByMouse: true
        placeholderText: qsTr("Nom")
        verticalAlignment: Text.AlignVCenter        
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: textUser.bottom
        anchors.topMargin: 60
    }

        // TEXT FIELD USERNAME
    TextField{
        id: login
        width: 300
        text: qsTr("")
        selectByMouse: true
        placeholderText: qsTr("Login")
        verticalAlignment: Text.AlignVCenter        
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: name.bottom
        anchors.topMargin: 20
    }

    // TEXT FIELD USERNAME
    TextField{
        id: passwordField
        width: 300
        text: qsTr("")
        selectByMouse: true
        placeholderText: qsTr("Mot de passe")
        verticalAlignment: Text.AlignVCenter        
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: login.bottom
        anchors.topMargin: 20
        echoMode: TextInput.Password
    }

    // BUTTON LOGIN
    Button{
        id: buttonLogin
        width: 300
        text: qsTr("Valider")
        anchors.top: passwordField.bottom
        anchors.topMargin: 50       
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: backend.checkLogin(name.text, login.text, passwordField.text)
    }
}