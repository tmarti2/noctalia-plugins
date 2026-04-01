import QtQuick
import QtQuick.Layouts
import qs.Commons
import qs.Widgets

ColumnLayout {
    id: root
		spacing: Style.marginM


		property var pluginApi: null
    property real  editVolume:    pluginApi?.pluginSettings?.volume    			?? 0.5
    property real  editDifficulty:pluginApi?.pluginSettings?.difficulty    	?? 50
    property bool  editShowDebug: pluginApi?.pluginSettings?.showDebug 			?? false
    property bool  showPercentage:pluginApi?.pluginSettings?.showPercentage ?? false

    function saveSettings() {
        pluginApi.pluginSettings.volume    			= root.editVolume
        pluginApi.pluginSettings.difficulty    	= root.editDifficulty
        pluginApi.pluginSettings.showDebug 			= root.editShowDebug
        pluginApi.pluginSettings.showPercentage = root.showPercentage
        pluginApi.saveSettings()
    }

    NLabel {
        label: "Volume"
        description: "Sound effects volume for feeding, playing and cleaning."
		}

    NSlider {
        Layout.fillWidth: true
        from: 0
        to: 1
        value: root.editVolume
        onValueChanged: root.editVolume = value
		}
			
    NDivider {
        Layout.fillWidth: true
        Layout.topMargin: Style.marginS
        Layout.bottomMargin: Style.marginS
		}

    NLabel {
        label: "Difficulty"
				description: "Higher values make your pet require more frequent care."
		}

    NSlider {
        Layout.fillWidth: true
        from: 0
        to: 100
        value: root.editDifficulty
        onValueChanged: root.editDifficulty = value
    }

    NDivider {
        Layout.fillWidth: true
        Layout.topMargin: Style.marginS
        Layout.bottomMargin: Style.marginS
    }

    NToggle {
        Layout.fillWidth: true
        label: "Debug Buttons"
        description: "Show buttons to manually trigger stat changes for testing."
        checked: root.editShowDebug
        onToggled: checked => root.editShowDebug = checked
    }

    NDivider {
        Layout.fillWidth: true
        Layout.topMargin: Style.marginS
        Layout.bottomMargin: Style.marginS
    }

		NToggle {
				Layout.fillWidth: true
				label: "Percentage"
				description: "Show percentage values next to each stat bar."
				checked: root.showPercentage ?? false
				onToggled: checked => root.showPercentage = checked
		}

    Item { Layout.fillHeight: true }
}
