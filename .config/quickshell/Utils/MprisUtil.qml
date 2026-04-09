pragma Singleton

import Quickshell
import Quickshell.Services.Mpris 
import QtQuick


//https://github.com/tripathiji1312/quickshell/blob/main/services/Players.qml
 Singleton {
    id: root

    readonly property var list: Mpris.players.values

    property bool visible: true

    property var active: {
        for (var i = 0; i < list.length; i++) {
            if (list[i]?.isPlaying) {
                console.log(list[i].trackTitle)
                return list[i]
            }
        }

        return list[0] ?? null
    }  
 
    Connections {
        target: Mpris.players

        function onValuesChanged() {
            root.updateActivePlayer()
        }
    }

    function updateActivePlayer() {
        var newActive = null

        for (var i = 0; i < list.length; i++) {
            if (list[i]?.isPlaying) {
                newActive = list[i]
                break
            }
        }
        if (!newActive && list.length > 0) {
            newActive = list[0]
        }

        if (active !== newActive) {
            active = newActive
        }
    }

    Timer {
        interval: 2000
        running: root.visible && list.length > 0
        repeat: true
        triggeredOnStart: true
        onTriggered: root.updateActivePlayer()
    }

    function getIdentity(player: var): string {
        return player?.identity ?? "Unknown";
    }
 }

