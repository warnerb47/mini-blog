import QtQuick 6
import QtQuick.Controls 6
import "../components/controls"

Item {
    Text{
        id: textUser
        text: "New User page"
        anchors.verticalCenter: parent.verticalCenter
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: "#ffffff"
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 10
    }
}