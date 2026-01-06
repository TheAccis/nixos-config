pragma Singleton
import QtQuick 2.0

QtObject {
	readonly property double radius: 16

	readonly property QtObject font: QtObject {
		readonly property int size: 14
	}

	readonly property QtObject palette: QtObject {
		readonly property string red:     "#fb4934"
		readonly property string green:   "#b8bb26"
		readonly property string yellow:  "#fabd2f"

		readonly property string background: "#282828"
		readonly property string surface:    "#3c3836"
		readonly property string text:       "#ebdbb2"
		readonly property string textMuted:  "#a89984"
		readonly property string accent:     "#83a598" 
	}
}