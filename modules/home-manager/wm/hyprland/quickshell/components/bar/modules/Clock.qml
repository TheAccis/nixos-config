import QtQuick
import Config

Text {
	font.pixelSize: Theme.font.size
	color: Theme.palette.text

	Component.onCompleted: updateTime()

	function updateTime() {
		text = Qt.formatTime(new Date(), "HH:mm:ss")
	}

	Timer {
		interval: 1000
		repeat: true
		running: true
		onTriggered: updateTime()
	}
}