import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import "./blocks"

Scope {
    Variants {
        model: Quickshell.screens;
        delegate: Component {
            PanelWindow {
                required property var modelData
                screen: modelData
                color: '#00282828'
                anchors {
                    top: true
                    right: true
                }
                implicitWidth: 120
                implicitHeight: 185
                MenuPanel {
                    
                }
            }
        }
    }
}