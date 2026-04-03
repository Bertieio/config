import Quickshell
import QtQuick

import "../Modules"


Rectangle {
    id: rectanglePower

    property bool isHovered: hover.hovered;
    property bool isClicked: false;


    color: isHovered || isClicked ? root.activeColor : root.inactiveColor;
    radius: root.radius;

    x: root.margin;
    //y: root.margin

    implicitHeight: root.itemHeight;
    implicitWidth: textPower.implicitWidth + root.margin * 4;
    
    Text {
        id: textPower;
        
        x: root.margin*2;
        y: root.margin;
        
        font.pointSize: root.fontSize;
        font.family: "JetBrainsMono Nerd Font Propo"
        font.bold: true
        color: root.textColor;

        text: "⏻"
    }
    HoverHandler {
        id: hover;
        cursorShape: Qt.PointingHandCursor; 
    }
   
    MouseArea {
        anchors.fill: parent;
        onClicked:{
            if(!isClicked){
                isClicked = true
            }else{
                isClicked = false
            }
        }
        cursorShape: Qt.PointingHandCursor; 
    }
}