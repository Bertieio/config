import Quickshell
import QtQuick
import QtQuick.Layouts

import "./Settings"

PopupWindow {
    id: settingsPanel;

    property var parentBar:;
    property var parentObject:;

    visible: true;

    anchor.window: root;
    anchor.rect.x: parentBar.x + parentObject.x;
    anchor.rect.y: parentObject.y + parentObject.implicitHeight + root.margin*3;

    color: "#000000ff"; 

    implicitWidth: settingsPanelRectangle.implicitWidth+settingsPanelRectangle.x;
    implicitHeight: settingsPanelRectangle.implicitHeight+settingsPanelRectangle.y;

    Rectangle{
        id: settingsPanelRectangle;
        implicitWidth: 300;
        implicitHeight: settingsList.implicitHeight+root.radius*2;
        color: root.activeColor;
        radius: root.radius;

        ColumnLayout{
            id: settingsList
            spacing: root.margin;
            anchors.fill: parent;
            anchors.topMargin: root.radius;
            anchors.bottomMargin: root.radius;
            Brightness{}
            Volume{}
        }        

    }
}