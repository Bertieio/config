import QtQuick
import Quickshell
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell.Io

//

//wpctl set-volume @DEFAULT_AUDIO_SINK@ 
//wpctl get-volume @DEFAULT_AUDIO_SINK@

Rectangle{
    id: volumeRectange

    property real volume: volumeSlider.value
    property var getVolumeValue

    Component.onCompleted: {
        getVolume()
        updateTimer.start()
    }

    property string volumeIcon: {
        if (volume === 0){
            return ""
        }
        if (volume < 0.45){
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
            //width: 50
            text: volumeIcon
            font.pointSize: 30;
            font.family: "JetBrainsMono Nerd Font Propo"
            font.bold: true
            color: root.textColor;
        }
        Slider {
            id: volumeSlider
            from: 0
            to: 1
            value: getVolumeValue
            onMoved: setVolume(value)
            implicitHeight: volumeLayout.height
            implicitWidth: volumeLayout.width-50-root.margin*2
        }
    }

    function setVolume(value){
        const cmd = "wpctl set-volume @DEFAULT_AUDIO_SINK@ " + value 
        setVolumeProcess.command = ["/bin/sh", "-c", cmd]
        setVolumeProcess.running = true    
    }

    function getVolume(){
        const cmd = "sh ~/.config/quickshell/Helper/getVolume.sh"
        getVolumeProcess.command =["/bin/sh", "-c", cmd]
        getVolumeProcess.running = true
    }

    Process {
        id: setVolumeProcess
        running: false
    }

    Process {
        id: getVolumeProcess
        running: false
        stdout: SplitParser{
            onRead: data => {
                const value = data
                if(!isNaN(value)){
                    getVolumeValue = data
                }
            }
        }
    }
    Timer {
        id: updateTimer
        interval: 2000
        repeat: true
        triggeredOnStart: true
        onTriggered: getVolume()
    }
}