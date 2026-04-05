import Quickshell
import QtQuick
import Quickshell.Io
import QtQuick.Layouts
import Quickshell.Services.Notifications

import "./Modules"

NotificationServer {
  id: notifServer
  persistenceSupported: true
  bodySupported: true
  bodyMarkupSupported: true
  bodyHyperlinksSupported: false
  bodyImagesSupported: false
  actionsSupported: true
  actionIconsSupported: false
  imageSupported: true

  onNotification: notif => {
  }
}

//PanelWindow {
//  id: notifcations;
//  visible: false
//  anchors {
//    top: true
//    right: true
//  }
//}