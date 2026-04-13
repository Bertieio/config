import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Mpris 

import "../Modules"
import "../Components"
import "../Utils"
import "../Cassette"

// 

Rectangle{
    id: playerRectangle
    
    property bool tTAClicked: false;

    property var player: MprisUtil.active;
    property int tTAWidith: 300

    radius: root.radius;
    implicitHeight: root.itemHeight;
    color: root.inactiveColor;

    implicitWidth: mediaRow.implicitWidth + root.margin * 4;

    RowLayout{
        id: mediaRow
        x: root.margin * 2
        spacing: root.margin

        // 󰒭 󰒮 󰏤
        Rectangle{
            color: isHovered ? root.activeColorDarker : root.inactiveColorDarker
            implicitHeight: root.itemHeight
            implicitWidth: playButton.implicitWidth + root.margin*4
            radius: root.radius
            property bool isHovered: mouseLast.containsMouse
            
            Text{
                anchors.fill: parent
                id: prevButton
                font.pointSize: root.fontSize;
                font.family: "JetBrainsMono Nerd Font Propo"
                font.bold: true
                color: root.textColor;
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter

                text: "󰒮" 
            }

            MouseArea {
                id: mouseLast;
                hoverEnabled: true
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor; 
                onClicked: {
                    player.previous()
                }
            }
        }


        Rectangle{
            color: isHovered ? root.activeColorDarker : root.inactiveColorDarker
            implicitHeight: root.itemHeight
            implicitWidth: playButton.implicitWidth + root.margin*4
            radius: root.radius
            property bool isHovered: mousePlay.containsMouse
            
            Text{
                anchors.fill: parent
                id: playButton
                font.pointSize: root.fontSize;
                font.family: "JetBrainsMono Nerd Font Propo"
                font.bold: true
                color: root.textColor;
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter

                text: player.isPlaying ? "": "" 
        
        
            }
            MouseArea {
                id: mousePlay;
                hoverEnabled: true
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor; 
                onClicked: {
                    player.togglePlaying()
                }
            }
        }


        Rectangle{
            color: isHovered ? root.activeColorDarker : root.inactiveColorDarker
            implicitHeight: root.itemHeight
            implicitWidth: playButton.implicitWidth + root.margin*4
            radius: root.radius
            property bool isHovered: mouseNext.containsMouse
            
            Text{
                anchors.fill: parent
                id: nextButton
                font.pointSize: root.fontSize;
                font.family: "JetBrainsMono Nerd Font Propo"
                font.bold: true
                color: root.textColor;
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter

                text: "󰒭" 
            }

            MouseArea {
                id: mouseNext;
                hoverEnabled: true
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor; 
                onClicked: {
                    player.next()
                }
            }
        }

        Rectangle{
            color: tTAClicked ? root.activeColorDarker : root.inactiveColorDarker
            implicitWidth: tTAWidith+root.margin*2
            implicitHeight: root.itemHeight
            radius: root.radius
        
            Item{
                //anchors.fill: parent
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.left: parent.left// - root.margin*2
                anchors.right: parent.right// - root.margin*2
                
                id: mediaBar
                Layout.preferredWidth: tTAWidith + root.margin*2
                Layout.preferredHeight: parent.implicitHeight
                Layout.alignment: Qt.AlignVCenter
                clip: true
                x: root.margin*2;


                Text{
                    id: trackTitleArtist
                    y: root.margin;        

                    //anchors.verticalCenter: parent.verticalCenter

                    font.pointSize: root.fontSize;
                    font.family: "JetBrainsMono Nerd Font Propo"
                    font.bold: true
                    color: root.textColor;
                    text: player.trackTitle + "|" + player.trackArtist
                
                    property bool needsScroll: implicitWidth > tTAWidith
                    
                    x: needsScroll ? 0 : (tTAWidith - implicitWidth) / 2

                    Behavior on x {
                        enabled: !marqueeAnim.running
                        NumberAnimation { duration: 300; easing.type: Easing.OutCubic }
                    }

                    SequentialAnimation {
                        id: marqueeAnim
                        running: trackTitleArtist.needsScroll
                        loops: Animation.Infinite

                        PauseAnimation { duration: 2000 }
                        NumberAnimation {
                            target: trackTitleArtist
                            property: "x"
                            to: -(trackTitleArtist.implicitWidth+100)
                            duration: trackTitleArtist.implicitWidth * 30
                            easing.type: Easing.Linear
                        }
                        PropertyAction {
                            target: trackTitleArtist
                            property: "x"
                            value: 300
                        }
                        NumberAnimation{
                            target: trackTitleArtist
                            property: "x"
                            to: 0
                            easing.type: Easing.OutCubic
                        }
                    }
                }

            }
            MouseArea{
                id: mouseTTA
                hoverEnabled: true
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    if(!tTAClicked){
                        tTAClicked = true
                    }else{
                        tTAClicked = false
                    }
                }
            }
            LazyLoader {
                active: tTAClicked
                Walkman{parentBar: parent; parentObject: playerRectangle}
            }
        }
    }

}