import Quickshell
import QtQuick
import Quickshell.Io
import QtQuick.Layouts
import Quickshell.Services.Notifications

import "../Modules"
import "../Utils"
import "../Components"


PanelWindow {
  id: notifBar;
  visible: NotificationsUtil.displayNotifs

  implicitWidth: notifList.implicitWidth
  implicitHeight: notifList.implicitHeight

  color: "#000000dd"

  anchors {
    top: true
    right: true
  }

  ColumnLayout {
    id: notifList
    Repeater {
      model: NotificationsUtil.popupNotifs
      NotificationBox{n: modelData}
    }
  }
}