import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts

Rectangle {
    MarginWrapperManager { 
        margin: 5
    }
    radius: 12
    color: "#80282828"
    border.width: 2
    border.color: "#458588"
    ColumnLayout {
        spacing: 4
        BorderLabel {
            text: "Power Menu"
            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
        }
        MenuButton { buttonText: "Lock PC"; buttonCommand: ["sh", "-c", "~/.config/quickshell/PowerMenu/screenlock.sh"]; Layout.alignment: Qt.AlignHCenter }
        MenuButton { buttonText: "Shutdown"; buttonCommand: ["systemctl", "poweroff"];  Layout.alignment: Qt.AlignHCenter }
        MenuButton { buttonText: "Reboot"; buttonCommand: ["systemctl", "reboot"];  Layout.alignment: Qt.AlignHCenter }
        MenuButton { buttonText: "Logout"; buttonCommand: ["niri", "msg", "action", "quit"];  Layout.alignment: Qt.AlignHCenter }
        MenuButton { buttonText: "Close Menu"; buttonCommand: ["qs", "kill", "-c", "PowerMenu"];  Layout.alignment: Qt.AlignHCenter }
    }
}
