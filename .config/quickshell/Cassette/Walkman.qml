import QtQuick
import Quickshell
import QtQuick.Layouts

PopupWindow{
    id: cassetteWindow
    visible: true
    property var parentBar:;
    property var parentObject:;
    color:"#000000ff"
    anchor.window: topBar
    anchor.rect.x: parentBar.x + parentObject.x;
    anchor.rect.y: parentObject.y + parentObject.implicitHeight + root.margin*3 + 75;

    implicitHeight: cassetteBody.implicitHeight
    implicitWidth: cassetteBody.implicitWidth

    Rectangle{
        id: cassetteBody
        color: '#535b67'
        implicitHeight: 200
        implicitWidth: 400
        radius: 15
    }
}
