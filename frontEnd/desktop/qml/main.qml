import QtQuick 6
import QtQuick.Window 2.15
import QtQuick.Controls 6
import QtQuick.Controls.Material 2.15


ApplicationWindow{
    id: window 
    width: 400
    height: 580
    visible: true
    title: qsTr("Login Page")

    // SET FLAGS
    flags: Qt.WindowCloseButtonHint | Qt.WindowMinimizeButtonHint | Qt.CustomizeWindowHint | Qt.MSWindowsFixedSizeDialogHint | Qt.WindowTitleHint

    // SET MATERIAL STYLE
    Material.theme: Material.Dark
    Material.accent: Material.LightBlue

    // IMAGE IMPORT
    // Image{
    //     id: image 
    //     width: 300
    //     height: 120
    //     source: "../images/logo.png"        
    //     anchors.horizontalCenter: parent.horizontalCenter
    //     anchors.top: topBar.bottom
    //     anchors.topMargin: 60
    // }

    Rectangle{ id: topElement}

    Text{
        id: textUser
        text: "Connexion dashboard Mini Blog"
        anchors.top: topElement.bottom
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: "#ffffff"
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 15
        anchors.topMargin: 70
    }

    // TEXT FIELD USERNAME
    TextField{
        id: usernameField
        width: 300
        text: qsTr("")
        selectByMouse: true
        placeholderText: qsTr("Login")
        verticalAlignment: Text.AlignVCenter        
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: textUser.bottom
        anchors.topMargin: 60
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
        anchors.top: usernameField.bottom
        anchors.topMargin: 30
        echoMode: TextInput.Password
    }

        // BUTTON LOGIN
    Button{
        id: buttonLogin
        width: 300
        text: qsTr("se connecter")
        anchors.top: passwordField.bottom
        anchors.topMargin: 50       
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: backend.checkLogin(usernameField.text, passwordField.text)
    }


    Connections {
        target: backend

        // FUNTION OPEN NEW WINDOW (APP WINDOW)
        function onSignalLogin(boolValue) {
            if(boolValue){
                var component = Qt.createComponent("app.qml")
                var win = component.createObject()
                win.show()
                visible = false
            } else{
                // CHANGE USER COLOR
                usernameField.Material.foreground = Material.Pink
                usernameField.Material.accent = Material.Pink
                passwordField.Material.foreground = Material.Pink
                passwordField.Material.accent = Material.Pink
            }
        }
    }

}