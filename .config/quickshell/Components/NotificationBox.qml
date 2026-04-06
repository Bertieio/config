pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Services.Notifications

import "../Utils"  

Rectangle{
    id: notif

    property var n

    property string image: !n.image && !!n.appIcon ? n.appIcon : n.image
    property bool hasImage: !!n.image && !!n.appIcon
    property int elapsed: getElapsed()

    implicitHeight: 150 + root.margin*4
    implicitWidth: 500 + root.margin*4
    color: root.activeColor

    radius: root.radius

    Rectangle {
        id: notifContent
        anchors.fill: parent
        anchors.margins: root.margin

        color: root.activeColor

        radius: root.radius 
        
        Image{
            x: margin*2
            y: margin
            source: image
            height: 150
            width: 150
        }

        Text {
            text: n.summary
        }

    }

    
    
    function getElapsed(): int {
        if (elapsed >= root.notifTimeout && root.notifAgeOut){
            NotificationsUtil.dismisNotif(n)
        }
        return Math.floor(Date.now() / 1000) - Math.floor(n.time / 1000);
    }

    Timer {
        running: root.notifAgeOut
        interval: 1000;
        repeat: true
        onTriggered: notif.elapsed = notif.getElapsed()
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: mouse => {
            if (mouse.button == Qt.RightButton){
                NotificationsUtil.dismisNotif(n)
            }
        }
    }
}