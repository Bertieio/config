import Quickshell
import QtQuick
import Quickshell.Io

import "./Modules"

PanelWindow {
  property real margin: 5
  anchors {
    top: true
    left: true
    right: true
  }
  color: '#000000dd'
  implicitHeight: 40

  Clock{}
}