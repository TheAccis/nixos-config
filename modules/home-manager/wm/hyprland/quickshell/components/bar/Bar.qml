import Quickshell.Hyprland
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell.Io
import Quickshell
import QtQuick
import Config

import "./modules" as Modules

PanelWindow {
	color: "transparent"
	surfaceFormat.opaque: false

	anchors {
		left: true
		top: true
		right: true
	}

	property var screen
	property var modelData
	implicitHeight: 50

	Rectangle {
		color: Theme.palette.background
		border.width: 0
		radius: Theme.radius
		anchors {
			leftMargin: 10
			rightMargin: 10
			topMargin: 10

			fill: parent
		}

		RowLayout {
			anchors.fill: parent
			anchors.leftMargin: 10
			anchors.rightMargin: 10
			spacing: 15

			Modules.Workspaces {

			}

			Item {
				Layout.fillWidth: true
			}

			Modules.Clock {
				Layout.alignment: Qt.AlignVCenter
			}
		}
	 }
}