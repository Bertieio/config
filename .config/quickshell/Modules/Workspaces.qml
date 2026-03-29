import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

import "../Modules"
import "../Components"

// 

Rectangle{
    id: workspaces
    
    property bool isHovered: hover.hovered;
    property var ws: Hyprland.workspaces ;

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

        Repeater {
            model: ws;
            WorkspaceItem{workspaceItem: modelData}
        }
    }

}