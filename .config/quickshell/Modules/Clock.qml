import Quickshell
import QtQuick

import "../Modules"


Rectangle {
    id: rectangleClock

    property bool isHovered: hover.hovered;
    
    color: isHovered ? root.activeColor : root.inactiveColor;
    radius: root.radius;

    implicitHeight: root.itemHeight;
    implicitWidth: textClock.implicitWidth + root.margin * 4;
    
    
    SystemClock {
        id: clock;
        precision: SystemClock.Seconds
    }

    HoverHandler {
        id: hover;
        cursorShape: Qt.PointingHandCursor; 
    }

    Text {
        id: textClock;
        
        x: root.margin*2;
        y: root.margin;
        
        font.pointSize: root.fontSize;
        font.family: "JetBrainsMono Nerd Font Propo"
        font.bold: true
        color: root.textColor;

        text: " " + Qt.formatDateTime(clock.date, "hh:mm")
    }

    LazyLoader {
        active: isHovered;

        Calendar{parentBar: parent; parentObject: rectangleClock}
    }
}