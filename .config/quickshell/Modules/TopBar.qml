import Quickshell
import QtQuick
import Quickshell.Io
import QtQuick.Layouts

import "../Modules"
import "../Components"


  PanelWindow {
    id: topBar;
    anchors {
      top: true
      left: true
      right: true
    }
    color: "#000000dd"
    implicitHeight: 50

    RowLayout {
      id: leftBar
      spacing:  margin*2
      anchors.left: parent.left
      anchors.leftMargin: margin*2
    
      anchors.top: parent.top
      anchors.topMargin: margin*2
    
      Clock{}
      Battery{}
      Blank{w:300}
      ResourceUsage{}
    }

    RowLayout {
      id: centerBar
      spacing:  margin*2
    
      anchors.horizontalCenter: parent.horizontalCenter
    
      anchors.top: parent.top
      anchors.topMargin: margin*2
    
      Workspaces{}
    }
  
    RowLayout {
      id: rightBar
      spacing:  margin*2
    
      anchors.right: parent.right
      anchors.rightMargin: margin*2

      anchors.top: parent.top
      anchors.topMargin: margin*2
    
      Player{}
      Blank{w:300}
      Settings{}
      Power{}
    }
  }
