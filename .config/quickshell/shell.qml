import Quickshell
import QtQuick
import Quickshell.Io
import QtQuick.Layouts

import "./Modules"


ShellRoot{
  id: root;

  property color activeColor: "#426180"; 
  property color activeColorDarker: '#2f465d'; 

  property color inactiveColor: "#488165"; 
  property color inactiveColorDarker: '#365747'; 
  
  property color textColor: "#000017"; 
  property color secondaryColor: "#2d2d40";

  property color warnColor: '#c7ab3b';
  property color alertColor: '#c23737';

  property real margin: 5;
  property real radius: 20;
  property real fontSize: 15;
  property real itemHeight: 35;

  property int notifTimeout: 10;
  property bool notifAgeOut: true;

  TopBar{} 
  Notifications{}

}
