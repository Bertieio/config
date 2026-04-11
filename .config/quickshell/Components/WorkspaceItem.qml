import Quickshell
import QtQuick
//  


Text {
    id: workspace;
    property var workspaceItem: ;
    property bool workspaceActive: workspaceItem.active;
    property bool isHovered: mouse.containsMouse;

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
    
    MouseArea {
        id: mouse
        hoverEnabled: true
        anchors.fill: parent;
        onClicked:{
            workspaceItem.activate()
        }
        cursorShape: Qt.PointingHandCursor; 
    }

}