import Quickshell
import QtQuick
import QtQuick.Layouts;

PopupWindow {
    id: calendar;

    property var parentBar:;
    property var parentObject:;

    visible: true;

    anchor.window: root;
    anchor.rect.x: parentBar.x + parentObject.x;
    anchor.rect.y: parentObject.y + parentObject.implicitHeight + root.margin*3;

    color: "#000000ff"; 

    implicitWidth: calendarRectangle.implicitWidth+calendarRectangle.x;
    implicitHeight: calendarRectangle.implicitHeight+calendarRectangle.y;

    Rectangle{
        
        id: calendarRectangle;
        implicitWidth: 300;
        implicitHeight: 200;
        color: root.activeColor;
        radius: root.radius;
        
        Text{
            id: month;

            anchors.fill: parent
        
            font.pointSize: 15;
            font.family: "JetBrainsMono Nerd Font Propo"
            font.bold: true

            color: root.textColor;

            text: Qt.formatDateTime(clock.date, "MMMM");
            horizontalAlignment: Text.AlignHCenter; 
        }
        RowLayout{
            y: 20;
            x: 20;
            implicitWidth: calendarRectangle.implicitWidth;

            Text{
                text: "M"
                font.pointSize: 12;
                font.family: "JetBrainsMono Nerd Font Propo"
                font.bold: true
                color: root.secondaryColor;
            }
            Text{
                text: "T"
                font.pointSize: 12;
                font.family: "JetBrainsMono Nerd Font Propo"
                font.bold: true
                color: root.secondaryColor;
            }
            Text{
                text: "W"
                font.pointSize: 12;
                font.family: "JetBrainsMono Nerd Font Propo"
                font.bold: true
                color: root.secondaryColor;
            }
            Text{
                text: "T"
                font.pointSize: 12;
                font.family: "JetBrainsMono Nerd Font Propo"
                font.bold: true
                color: root.secondaryColor;
            }
            Text{
                text: "F"
                font.pointSize: 12;
                font.family: "JetBrainsMono Nerd Font Propo"
                font.bold: true
                color: root.secondaryColor;
            }
            Text{
                text: "S"
                font.pointSize: 12;
                font.family: "JetBrainsMono Nerd Font Propo"
                font.bold: true
                color: root.secondaryColor;
            }
            Text{
                text: "S"
                font.pointSize: 12;
                font.family: "JetBrainsMono Nerd Font Propo"
                font.bold: true
                color: root.secondaryColor;
            }
        }
    }
    
   


}