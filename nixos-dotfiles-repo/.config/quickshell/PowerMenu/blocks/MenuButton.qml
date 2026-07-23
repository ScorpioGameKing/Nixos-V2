import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Controls.Basic

Button {
    id: control
    required property string buttonText
    required property list<string> buttonCommand

    text: buttonText
    implicitWidth: 90
    implicitHeight: 20
    contentItem: Text {
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.bold: true
        font.family: "Agave Nerd Font"
        font.pixelSize: 16
        color: "#ebdbb2"
        text: parent.text
    }
    background: Rectangle {
        implicitWidth: 80
        implicitHeight: 20
        radius: 8
        color: "#32302f"
        border.width: 2
        border.color: control.down ? "#fe8019": "#83a598"
    }
    Process {
        id: process
        running: false
    }
    onClicked: process.exec(buttonCommand)
}