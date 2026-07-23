import Quickshell
import QtQuick
import QtQuick.Layouts

Rectangle {
    required property string text
    id: labelBackground
    implicitWidth: 110
    implicitHeight: 30
    radius: 8
    color: "#32302f"
    border.width: 2
    border.color: "#458588"
    Text {
        id: labelObj
        anchors.centerIn: parent
        font.bold: true
        font.underline: true
        font.family: "Agave Nerd Font"
        font.pixelSize: 20
        color: "#ebdbb2"
        text: parent.text
    }
} 