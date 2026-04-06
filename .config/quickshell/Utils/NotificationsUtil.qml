pragma Singleton
pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Services.Notifications

Singleton {
    id: root

    property var popupNotifs: []
    property var allNotifis: []

    property bool displayNotifs: false

    NotificationServer{
        id: notifiServer
        persistenceSupported: true
        bodySupported: true
        bodyMarkupSupported: true
        bodyHyperlinksSupported: false
        bodyImagesSupported: false
        actionsSupported: true
        actionIconsSupported: false
        imageSupported: true

        onNotification: notif => {
            notif.tracked = true;
            notif.time = Date.now();
            root.onNewNotif(notif)
        }
    }

    function onNewNotif(notif){
        allNotifis = [notif, ...allNotifis];
        
        if (notif.lastGeneration)
            return;

        popupNotifs = [notif, ...popupNotifs]
        displayNotifs = true 
        console.log("notif: appName", notif.appName || "null", ", appIcon", notif.appIcon || "null", ", image", notif.image || "null", ", expireTimeout", notif.expireTimeout)    
    }

    function dismisNotif(notif){
        popupNotifs = popupNotifs.filter(n => n != notif);
        if (popupNotifs.length == 0){
            displayNotifs = false;
        }   
        console.log("removed" + popupNotifs.length)

    }
}