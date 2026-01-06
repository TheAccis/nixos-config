import QtQuick
import Quickshell.Hyprland
import Config

Item {
    property int totalWorkspaces: 5
    property int currentWorkspace: 1
    property int dotSize: 6

    width: (dotSize * totalWorkspaces) + (totalWorkspaces - 1) + 16
    height: dotSize + 8

    Connections {
        target: Hyprland.activeWorkspace
        function onIdChanged() {
            if (Hyprland.activeWorkspace?.id) {
                currentWorkspace = Hyprland.activeWorkspace.id
            }
        }
    }

    Component.onCompleted: {
        if (Hyprland.activeWorkspace?.id) {
            currentWorkspace = Hyprland.activeWorkspace.id
        }
    }

    // Контейнер с закругленными краями
    Rectangle {
        anchors.fill: parent
        radius: Theme.radius
        color: Theme.palette.surface
        border.width: 0

        // Кружки (точки)
        Row {
            anchors {
                centerIn: parent
                leftMargin: 8
                rightMargin: 8
            }
            spacing: spacing

            Repeater {
                model: totalWorkspaces

                Rectangle {
                    width: dotSize
                    height: dotSize
                    radius: Theme.radius
                    color: Theme.palette.textMuted
                }
            }
        }

        // Кольцо-индикатор (плавно движется)
        Rectangle {
            id: indicator
            width: dotSize
            height: dotSize
            radius: Theme.radius
            color: "transparent"
            border.width: 2
            border.color: Theme.palette.accent
            visible: currentWorkspace >= 1 && currentWorkspace <= totalWorkspaces

            x: {
                const index = currentWorkspace - 1
                const dotPosition = dotSize * index
                return dotPosition - (width - dotSize) / 2
            }

            Behavior on x {
                PropertyAnimation {
                    duration: 300
                    easing.type: Easing.OutCubic
                }
            }
        }
    }
}