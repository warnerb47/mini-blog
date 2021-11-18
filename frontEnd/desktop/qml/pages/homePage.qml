import QtQuick 6
import QtQuick.Controls 6
import QtQuick.Layouts 1.0
import Qt.labs.qmlmodels 1.0
import "../components/homePage"

Item {
    id: homeItem

    // CUSTOM PROPERTIES
    property ListModel users

    Rectangle {
        id: rectangle
        color: "#2c313c"
        anchors.fill: parent

        Rectangle {
            id: rectangleTop
            color: "#495163"
            radius: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 50
            anchors.leftMargin: 50
            anchors.topMargin: 36
            Button{
                id: deleteUser
                width: 200
                text: qsTr("charger les utilisateurs")
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 10
                background: Rectangle{
                    color: "#182494"
                }
                contentItem: Text {
                    text: deleteUser.text
                    color: "#ffffff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                onClicked: backend.getUsers()
            }

        }

        Rectangle {
            id: rectangleVisible
            color: "#1d2128"
            radius: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: rectangleTop.bottom
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.rightMargin: 50
            anchors.leftMargin: 50
            anchors.topMargin: 20

            Label {
                id: labelTextName
                y: 8
                height: 25
                color: "#5c667d"
                text: qsTr("Liste des utilisateurs")
                anchors.left: parent.left
                anchors.right: parent.right
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                font.pointSize: 14
            }


            ScrollView {
                id: scrollView
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                clip: true
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                anchors.bottomMargin: 10
                anchors.topMargin: 10
                ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
                ScrollBar.vertical.policy: ScrollBar.AsNeeded

                ListView {
                    id: view
                    // model: listModel
                    model: homeItem.users
                    Layout.minimumHeight: 25
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    anchors.fill: parent
                    // cacheBuffer: 100
                    spacing: 10
                    clip: true

                    delegate: Rectangle{
                        width: parent.width
                        radius: 5
                        anchors.horizontalCenter: parent.horizontalCenter
                        height: 40
                        color: Qt.lighter("#2c313c", 0.8)
                        
                        Text {
                            id: nameTxt
                            text: name
                            font.pointSize: 12
                            color: "#FFFFFF"
                            anchors.left: parent.left
                            anchors.leftMargin: 20
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        Button{
                            id: detailUserBtn
                            width: 100
                            text: qsTr("voir")
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.right: parent.right
                            anchors.rightMargin: 120
                            background: Rectangle{
                                color: "#059e1c"
                            }
                            contentItem: Text {
                                text: detailUserBtn.text
                                color: "#ffffff"
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                            onClicked: detailUser.open()
                            Popup {
                                id: detailUser
                                anchors.centerIn: Overlay.overlay
                                width: 400
                                height: 500
                                modal: true
                                focus: true
                                closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
                                background: Rectangle{
                                    color: "#2c313c"
                                }
                                
                                DetailUser{
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.top: parent.top
                                }
                            }
                        }

                        Button{
                            id: deleteUser
                            width: 100
                            text: qsTr("supprimer")
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.right: parent.right
                            anchors.rightMargin: 10
                            background: Rectangle{
                                color: "#8c1108"
                            }
                            contentItem: Text {
                                text: deleteUser.text
                                color: "#ffffff"
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                            // onClicked: backend.checkLogin(name.text, login.text, passwordField.text)
                        }
                    }
                    // highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
                    // focus: true
                }
            }
        }
    }

    ListModel {
        id: listModel
        ListElement {
            name: "Bill Smith"
            number: "555 3264"
        }
        ListElement {
            name: "John Brown"
            number: "555 8426"
        }
        ListElement {
            name: "John Brown"
            number: "555 8426"
        }
        ListElement {
            name: "John Brown"
            number: "555 8426"
        }
        ListElement {
            name: "John Brown"
            number: "555 8426"
        }
        ListElement {
            name: "John Brown"
            number: "555 8426"
        }
        ListElement {
            name: "John Brown"
            number: "555 8426"
        }
        ListElement {
            name: "Sam Wise"
            number: "555 0473"
        }
    }

    Connections {
        target: backend


        function onsignalUsers(usersList){
            console.log(homeItem.users)
            homeItem.users = usersList
        }

    }
}
