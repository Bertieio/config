pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Notifications

import "../Utils"  

//󰂚

Rectangle{
    id: notif

    property var n

    property string image: !n.image && !!n.appIcon ? n.appIcon : n.image
    property bool hasImage: !!n.image && !!n.appIcon
    property int elapsed: getElapsed()

    implicitHeight: 150 + root.margin*4
    implicitWidth: 500 + root.margin*4
    color: root.inactiveColor

    radius: root.radius

        

 

    Image{
        source: image
        height: 150
        width: 150
        x: root.margin*2
        y: root.margin*2
        visible: hasImage
    }
    Rectangle{
        height: 150
        width: 150
        x: root.margin*2
        y: root.margin*2
        visible: !hasImage
        radius: root.radius
        color: root.inactiveColorDarker
        Text {
            x:-10
            y:0
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter 
            verticalAlignment: Text.AlignVCenter
            text: "󰂚"
            height: parent.height
            width: parent.width
            font.pointSize: 115
            font.family: "JetBrainsMono Nerd Font Propo"
            color: root.secondaryColor

        }
    }

    Rectangle {
        height:150
        y: root.margin*2
        x: root.margin*4 + 150
        width: 350 - root.margin*2
        radius: root.radius
        color: root.inactiveColorDarker

    }
    Text {
        x: 150+root.margin*4
        y: root.margin*2
        font.pointSize:25
        font.bold: true
        font.family: "JetBrainsMono Nerd Font Propo"
        text: n.summary
    

    Text {
       // x: 150+root.margin*4
        //y: root.margin*2
        font.pointSize:25
        font.bold: true
        font.family: "JetBrainsMono Nerd Font Propo"
        text: n.body
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