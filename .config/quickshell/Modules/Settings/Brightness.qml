import QtQuick
import Quickshell
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell.Io

//󰃞󰃟󰃠

Rectangle{
    id: brightnessRectange

    property real brightness: brightnessSlider.value
    property real maxBrightnessValue
    property real getBrightnessValue

    property var log

    Component.onCompleted: {
        getMaxBrightness()
        getBrightness()
        updateTimer.start()
    }

    property string brightnessIcon: {
        if (brightness < 15){
            return "󰃞"
        }
        if (brightness < 75){
            return "󰃟"
        }
        else{
            return "󰃠"
        }
    }

    implicitHeight: 50
    implicitWidth: settingsPanelRectangle.width
    color: root.activeColorDarker
    
    RowLayout{
        id: brightnessLayout
        anchors.fill: parent
        anchors.leftMargin: root.margin
        anchors.rightMargin: root.margin
        Text{
            text: brightnessIcon
            font.pointSize: 30;
            font.family: "JetBrainsMono Nerd Font Propo"
            font.bold: true
            color: root.textColor;
        }
        Slider {
            id: brightnessSlider
            from: 1
            to: 100
            value: getBrightnessValue
            onMoved: setBrightness(value);
            implicitHeight: brightnessLayout.height
            implicitWidth: brightnessLayout.width-50-root.margin*2
        }
    }



    function setBrightness(value){
        const cmd = "brightnessctl set " + value + "%"
        setBrightnessProcess.command = ["/bin/sh", "-c", cmd]
        setBrightnessProcess.running = true
    }

    function getBrightness(){
        const cmd = "brightnessctl get"
        getBrightnessProcess.command = ["/bin/sh", "-c", cmd]
        getBrightnessProcess.running = true
    }

    function getMaxBrightness(){
        const cmd = "brightnessctl max"
        getMaxBrightnessProcess.command = ["/bin/sh", "-c", cmd]
        getMaxBrightnessProcess.running = true
    }


    Process {
        id: getMaxBrightnessProcess
        running: false
        
        stdout: SplitParser {
            onRead: data => {
                const value = parseInt(data.trim())
                if (!isNaN(value)){
                    maxBrightnessValue = value
                } 
            }
        }

    }

    Process {
        id: setBrightnessProcess
        running: false 
    }

    Process {
        id: getBrightnessProcess
        running: false

        stdout: SplitParser {
            onRead: data => {
                const value = parseInt(data.trim())
                if(!isNaN(value)) {
                    getBrightnessValue = (value / maxBrightnessValue) * 100
                }
            }
        }
    }

    Timer {
        id: updateTimer
        interval: 2000
        repeat: true
        triggeredOnStart: true
        onTriggered: getBrightness()
    }
}