import Quickshell
import QtQuick
import QtQuick.Layouts
 import Quickshell.Services.Mpris 

import "../Modules"
import "../Components"
import "../Utils"

// 

Rectangle{
    id: playerRectangle
    
    property bool isHovered: hover.hovered;
    property var player: MprisUtil.active;

    radius: root.radius;
    implicitHeight: root.itemHeight;
    color: isHovered ? root.activeColor : root.inactiveColor;

    implicitWidth: workspaceList.implicitWidth + root.margin * 4;


    HoverHandler {
        id: hover;
        cursorShape: Qt.PointingHandCursor; 
    }
    RowLayout{
        id: workspaceList
        anchors.horizontalCenter: parent.horizontalCenter
        y: root.margin;
        
        Text{
        x: root.margin*2;
        y: root.margin;
        
        font.pointSize: root.fontSize;
        font.family: "JetBrainsMono Nerd Font Propo"
        font.bold: true
        color: root.textColor;
            text: player.trackTitle + "|" + player.trackArtist
        }

    }

}