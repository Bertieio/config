import Quickshell
import QtQuick

Rectangle {
    property real w
    id: rectangleBlank
    color: "#000000dd"

   
    x: root.margin;

    implicitHeight: root.itemHeight;
    implicitWidth: w;
    
}