import QtQuick
import Quickshell
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell.Io

//

Rectangle{
    id: volumeRectange

    property real volume

    property string volumeIcon: {
        if (volume === 0){
            return ""
        }
        if (volume < 45){
            return ""
        }
        else{
            return ""
        }
    }

    implicitHeight: 50
    implicitWidth: settingsPanelRectangle.width
    color: root.activeColorDarker
    
    RowLayout{
        id: volumeLayout
        anchors.fill: parent
        anchors.leftMargin: root.margin
        anchors.rightMargin: root.margin
        Text{
            text: volumeIcon
            font.pointSize: 30;
            font.family: "JetBrainsMono Nerd Font Propo"
            font.bold: true
            color: root.textColor;
        }
        Slider {
            id: volumeSlider
            from: 1
            to: 100
            implicitHeight: volumeLayout.height
            implicitWidth: volumeLayout.width-50-root.margin*2
        }
    }
}