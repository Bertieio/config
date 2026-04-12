import QtQuick
import Quickshell
import QtQuick.Layouts
import Quickshell.Io

//

Rectangle {
    id: resourceUsage

    radius: root.radius;
    implicitHeight: root.itemHeight;
    color: root.inactiveColor;
    implicitWidth: resourceRow.implicitWidth+root.radius

    property int cpuUsage: 0
    property var lastCpuIdle: 0
    property var lastCpuTotal: 0
    property var cpuFormatted: "000"

    property int memUsage: 0
    property var memFormatted: "000"

    property int temp: 0
    property var tempFormatted: "000"

    RowLayout{
        id: resourceRow
        x: root.margin * 2
        spacing: root.margin

        Rectangle{
            id: cpuRectangle
            color: root.inactiveColorDarker
            implicitHeight: root.itemHeight
            implicitWidth: cpuText.implicitWidth + root.margin*4
            radius: root.radius
            
            Text{
                id: cpuText
                anchors.fill: parent
                font.pointSize: root.fontSize
                font.family: "JetBrainsMono Nerd Font Propo"
                font.bold: true
                color: root.textColor;
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter

                text: " " + cpuFormatted + "%"
            }
        }
        Rectangle{
            id: memRectangle
            color:   root.inactiveColorDarker
            implicitHeight: root.itemHeight
            implicitWidth: memText.implicitWidth + root.margin*4
            radius: root.radius
            
            Text{
                id: memText
                anchors.fill: parent
                font.pointSize: root.fontSize
                font.family: "JetBrainsMono Nerd Font Propo"
                font.bold: true
                color: root.textColor;
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter

                text: " " + memFormatted + "%"
            }
        }
        Rectangle{
            id: tempRectangle
            color:   root.inactiveColorDarker
            implicitHeight: root.itemHeight
            implicitWidth: memText.implicitWidth + root.margin*4
            radius: root.radius
            
            Text{
                id: tempText
                anchors.fill: parent
                font.pointSize: root.fontSize
                font.family: "JetBrainsMono Nerd Font Propo"
                font.bold: true
                color: root.textColor;
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter

                text: " " + tempFormatted + "󰔄"
            }
        }        
    }

    Process {
        id: cpuProc
        command: ["sh", "-c", "head -1 /proc/stat"]
        stdout: SplitParser {
            onRead: data => {
                if (!data) return
                var p = data.trim().split(/\s+/)
                var idle = parseInt(p[4]) + parseInt(p[5])
                var total = p.slice(1, 8).reduce((a, b) => a + parseInt(b), 0)
                if (lastCpuTotal > 0) {
                    cpuUsage = Math.round(100 * (1 - (idle - lastCpuIdle) / (total - lastCpuTotal)))

                    if(cpuUsage < 10){
                        cpuFormatted = "00" + cpuUsage
                    }
                    if (cpuUsage < 100 && cpuUsage > 9){
                        cpuFormatted = "0" + cpuUsage
                    }
                    if (cpuUsage > 99) {
                        cpuFormatted = cpuUsage
                    }
            

                }
                lastCpuTotal = total
                lastCpuIdle = idle
            }
        }
        Component.onCompleted: running = true
    }
    Process {
        id: memProc
        command: ["sh", "-c", "free | grep Mem"]
        stdout: SplitParser {
            onRead: data => {
                if (!data) return
                var parts = data.trim().split(/\s+/)
                var total = parseInt(parts[1]) || 1
                var used = parseInt(parts[2]) || 0
                memUsage = Math.round(100 * used / total)

                if (memUsage < 10) {
                    memFormatted = "00" + memUsage
                }
                if (memUsage < 100 && memUsage > 9){
                    memFormatted = "0" + memUsage
                }
                if (memUsage > 99){
                    memFormatted = memUsage
                }
            }
        }
    }

    Process {
        id: tempProc
        command: ["sh", "-c", "sensors | grep 'Package id'"]
        stdout: SplitParser {
            onRead: data => {
                if (!data) return
                var parts = data.trim().split(/\s+/)
                temp = parseInt(parts[3].split(".")[0].split("+")[1])
                
                if (temp < 10) {
                    tempFormatted = "00" + temp
                }
                if (temp < 100 && temp > 9){
                    tempFormatted = "0" + temp
                }
                if (temp > 99){
                    tempFormatted = temp
                }
            }
        }

    }

    Timer {
            interval: 2000
            running: true
            repeat: true
            onTriggered: {
                cpuProc.running = true
                memProc.running = true
                tempProc.running = true
            }

        }
}