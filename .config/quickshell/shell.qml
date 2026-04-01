import Quickshell
import QtQuick
import Quickshell.Io
import QtQuick.Layouts

import "./Modules"

PanelWindow {
  id: root;


  property color activeColor: "#426180"; 
  property color activeColorDarker: '#2f465d'; 
  property color inactiveColor: "#488165"; 
  property color textColor: "#000017"; 
  property color secondaryColor: "#2d2d40";

  property color warnColor: '#c7ab3b';
  property color alertColor: '#c23737';

  
  property real margin: 5;
  property real radius: 20;
  property real fontSize: 15;
  property real itemHeight: 35;



  
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
    
    Settings{}
  }
}