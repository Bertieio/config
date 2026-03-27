import Quickshell
import QtQuick
import QtQuick.Layouts;

PanelWindow {
    anchors {
        top: true;
        left: true;
    }
    id: calendar;

    color: "#000000ff"; 

    implicitWidth: calendarRectangle.implicitWidth+calendarRectangle.x;
    implicitHeight: calendarRectangle.implicitHeight+calendarRectangle.y;

    property real posX
    property real posY

    //colors
    property color activeColor: "#426180"; 
    property color inactiveColor: "#488165"; 
    
    property color textColor: '#000017'; 
    //colors

    Rectangle{
        
        id: calendarRectangle;
        implicitWidth: 300;
        implicitHeight: 200;
        color: activeColor;
        radius: 15;

        x: posX
        y: posX
        
        Text{
            id: month;

            anchors.fill: parent
        
            font.pointSize: 15;
            font.family: "JetBrainsMono Nerd Font Propo"
            font.bold: true

            text: Qt.formatDateTime(clock.date, "MMMM");
            horizontalAlignment: Text.AlignHCenter; 
        }
        RowLayout{
            y: 20;
            implicitWidth: calendarRectangle.implicitWidth;
            Text{
                text: "M"
            }
        }
    }
    
   


}