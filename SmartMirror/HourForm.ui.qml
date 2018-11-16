import QtQuick 2.4

Item {
    id: hourform
    width: 400
    height: 150
    Timer{
        interval : 500; running :true; repeat: true
        onTriggered: hour.text= timehandler.getHour()
    }
    Timer{
        interval : 3600; running :true; repeat: true
        onTriggered: date.text= timehandler.getDate()
    }
    /*Rectangle {
        id: hourformbackground
        height: 150
        color: "#000000"
        anchors.fill: parent*/

        Text {
            id: hour
            x: 100
            width: 300
            height: 100
            color: "#ffffff"
            text: timehandler.getHour()
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignRight
            font.pixelSize: 90
            font.family: "SFNS Display"
            font.styleName: "UltraLight"
        }

        Text {
            id: date
            x: 0
            width: 400
            height: 50
            color: "#ffffff"
            text: timehandler.getDate()
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 101
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignRight
            font.pixelSize: 30
            font.family: "SFNS Display"
            font.styleName: "Thin"
        }

}

/*##^## Designer {
    D{i:6;anchors_y:0}D{i:7;anchors_y:101}D{i:4;anchors_height:200;anchors_width:200;anchors_x:100;anchors_y:50}
}
 ##^##*/
