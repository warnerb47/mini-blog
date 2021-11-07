import QtQuick 6
import QtQuick.Controls 6
import "../controls"

Rectangle {
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

    Column {
        id: columnMenus
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        clip: true
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.bottomMargin: 90
        anchors.topMargin: 0

        LeftMenuBtn {
            id: btnHome
            width: leftMenu.width
            text: qsTr("Accueil")
            btnIconSource: "../../../images/svg_images/home_icon.svg"
            isActiveMenu: true
            onClicked: {
                btnHome.isActiveMenu = true
                btnSettings.isActiveMenu = false
                btnOpen.isActiveMenu = false
                stackView.push(Qt.resolvedUrl("../../pages/homePage.qml"))
            }
        }

        LeftMenuBtn {
            id: btnOpen
            width: leftMenu.width
            text: qsTr("Créer un utilisateur")
            btnIconSource: "../../../images/svg_images/user-plus.svg"
            onClicked: {
                btnHome.isActiveMenu = false
                btnSettings.isActiveMenu = false
                btnOpen.isActiveMenu = true
                stackView.push(Qt.resolvedUrl("../../pages/newUserPage.qml"))
            }
        }

    }

    LeftMenuBtn {
        id: btnSettings
        width: leftMenu.width
        text: qsTr("paramétre")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 25
        btnIconSource: "../../../images/svg_images/settings_icon.svg"
        onClicked: {
            btnHome.isActiveMenu = false
            btnSettings.isActiveMenu = true
            btnOpen.isActiveMenu = false
            stackView.push(Qt.resolvedUrl("../../pages/settingPage.qml"))
        }
    }
}