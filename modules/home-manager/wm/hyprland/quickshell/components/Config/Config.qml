pragma Singleton
import QtQuick 2.0

QtObject {
	readonly property QtObject workspaces: QtObject {
		readonly property int workspaceCount: 5
		readonly property int dotSize: 6
	}
}