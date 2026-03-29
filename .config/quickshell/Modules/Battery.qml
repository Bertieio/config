import Quickshell
import QtQuick
import Quickshell.Services.UPower

import "../Modules"


//󱐋

Rectangle {
    id: batteryRectangle

    property bool isHovered: hover.hovered;
    
    readonly property var battery: UPower.displayDevice;
    readonly property real percentage: Math.round((battery?.percentage ?? 0) * 100)
    readonly property bool isCharging: battery?.state === UPowerDevice.Charging
    readonly property bool isFullyCharged: battery?.state === UPowerDevice.FullyCharged


    property string batteryIcon: {
        if (percentage < 10) return "󰂃"
        if (percentage < 20) return "󰁺"
        if (percentage < 30) return "󰁻"
        if (percentage < 30) return "󰁻"
        if (percentage < 40) return "󰁼"
        if (percentage < 50) return "󰁽"
        if (percentage < 60) return "󰁾"
        if (percentage < 70) return "󰁿"
        if (percentage < 80) return "󰂀"
        if (percentage < 90) return "󰂁"
        if (percentage < 100) return "󰂂"
        if (percentage == 100) return "󰁹"
    }

    property string batteryIconC: batteryIcon + (isCharging ? "󱐋 " : " ");

    property color iconColor: {
        if(!isCharging){
            if (percentage <= 10) return root.alertColor
            if (percentage <= 25) return root.warnColor
            if (percentage > 25) return root.inactiveColor
        } else {
            return root.inactiveColor
        }
    }

    color: isHovered ? root.activeColor : iconColor;
    radius: root.radius;

    implicitHeight: root.itemHeight;
    implicitWidth: textBattery.implicitWidth + root.margin * 4;




    HoverHandler {
        id: hover;
        cursorShape: Qt.PointingHandCursor; 
    }

    Text {
        id: textBattery;
        
        x: root.margin*2;
        y: root.margin;
        
        font.pointSize: root.fontSize;
        font.family: "JetBrainsMono Nerd Font Propo"
        font.bold: true
        color: root.textColor;

        text: batteryIconC + percentage + "%"
    }
}