import "components/bar"
import Quickshell

ShellRoot {
    Variants {
        model: Quickshell.screens
        delegate: Bar { screen: screen }
    }
}