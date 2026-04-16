import QtQuick
import Quickshell
import QtQuick.Layouts

// 󰒭 󰒮 󰏤

PopupWindow{
    id: cassetteWindow
    visible: true
    property var parentBar:;
    property var parentObject:;
    color:"#000000ff"
    anchor.window: topBar
    anchor.rect.x: parentBar.x + parentObject.x + 25;
    anchor.rect.y: parentObject.y + parentObject.implicitHeight + root.margin*3 + 75;

    implicitHeight: cassetteBody.implicitHeight+25
    implicitWidth: cassetteBody.implicitWidth


    RowLayout{
        x: 25
        id: buttonRow
        spacing: 1
        Rectangle{
            id: lastButton
            implicitHeight: 50
            implicitWidth: 50
            radius: 5
            Text{
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                font.pointSize: 15
                text:"󰒮";
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignTop
            }
        }
        Rectangle{
            id: playButton

            implicitHeight: 50
            implicitWidth: 50
            radius: 5
            Text{
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                font.pointSize: 15
                text:"";
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignTop
            }
        }
        Rectangle{
            id: pauseButton

            implicitHeight: 50
            implicitWidth: 50
            radius: 5
            Text{
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                font.pointSize: 15
                text:"󰏤";
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignTop
            }
        }
        Rectangle{
            id: nextButton

            implicitHeight: 50
            implicitWidth: 50
            radius: 5
            Text{
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                font.pointSize: 15
                text:"󰒭";
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignTop
            }
        }
    }
    Rectangle{
        y: 25
        id: cassetteBody
        color: '#535b67dd'
        implicitHeight: 200
        implicitWidth: 400
        radius: 15
    }
}
