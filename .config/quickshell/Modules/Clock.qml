import Quickshell
import QtQuick
import "../Modules"
import "../theme/Colors.qml" as Theme


Rectangle {
    id: rectangleClock

    property real margin: 5;


    //colors
    property color activeColor: "#426180"; 
    property color inactiveColor: "#488165"; 
    
    property color textColor: '#000017'; 
    //colors


    property bool isHovered: hover.hovered;

    color: isHovered ? activeColor : inactiveColor;
    radius: 20;

    x: margin;
    y: margin

    implicitHeight: 35;
    implicitWidth: textClock.implicitWidth + margin * 4;
    
    
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
        
        x: parent.margin*2;
        y: parent.margin;
        
        font.pointSize: 15;
        font.family: "JetBrainsMono Nerd Font Propo"
        font.bold: true
        color: textColor;

        text: " " + Qt.formatDateTime(clock.date, "hh:mm")
    }

    LazyLoader {
        active: isHovered;

        Calendar{posX: x; posY: y}
    }
}