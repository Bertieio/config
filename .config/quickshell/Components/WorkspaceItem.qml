import Quickshell
import QtQuick
//  


Text {
    id: workspace;
    property var workspaceItem: ;
    property bool workspaceActive: workspaceItem.active;
    property bool isHovered: hover.hovered;

    font.pointSize: root.fontSize;
    font.family: "JetBrainsMono Nerd Font Propo"
    font.bold: true
    color: workspaceActive ? root.textColor : root.secondaryColor;


    property string workspaceIcon: {
        if(workspaceActive){
            return ""
        }
        if (isHovered){
            return ""
        }
        else {
            return ""
        }
    }


    text: workspaceIcon

    HoverHandler {
        id: hover;
        cursorShape: Qt.PointingHandCursor; 
    }

    MouseArea {
        anchors.fill: parent;
        onClicked:{
            workspaceItem.activate()
        }
        cursorShape: Qt.PointingHandCursor; 
    }

}