import QtQuick 2.4

Item {
    id: weather
    width: 400
    height: 400
    Timer{
        interval: 3600000;running: true; repeat: true
        onTriggered: {
            weatherhandler.reloadFore()
            icon1.source=  weatherhandler.getIcon(1)
            icon2.source=  weatherhandler.getIcon(2)
            icon3.source=  weatherhandler.getIcon(3)
            icon4.source=  weatherhandler.getIcon(4)
            icon5.source=  weatherhandler.getIcon(5)
            foretemp1.text=  weatherhandler.getforetemp(1)
            foretemp2.text= weatherhandler.getforetemp(2)
            foretemp3.text= weatherhandler.getforetemp(3)
            foretemp4.text= weatherhandler.getforetemp(4)
            foretemp5.text= weatherhandler.getforetemp(5)
            day1.text= weatherhandler.getDay(1)
            day2.text= weatherhandler.getDay(2)
            day3.text= weatherhandler.getDay(3)
            day4.text= weatherhandler.getDay(4)
            day5.text= weatherhandler.getDay(5)
            weatherhandler.reloadCurr()
            currenticon1.source = weatherhandler.getcurrIcon()
            currenttemp1.text = weatherhandler.getcurrTemp()
            minmaxtemp1.text= weatherhandler.getminmax()
            currentdesc1.text=  weatherhandler.getcurrDesc()
        }
    }
    /*Rectangle {
        id: weatherbackground
        color: "#000000"
        anchors.fill: parent*/

        Text {
            id: day1
            width: 40
            height: 20
            color: "#ffffff"
            text: weatherhandler.getDay(1)
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.left: parent.left
            anchors.leftMargin: 30
            anchors.top: parent.top
            anchors.topMargin: 10
            font.pixelSize: 20
            font.family: "SFNS Display"
            font.styleName: "Regular"
        }

        Text {
            id: day2
            x: -9
            y: -6
            width: 40
            height: 20
            color: "#ffffff"
            text: weatherhandler.getDay(2)
            verticalAlignment: Text.AlignVCenter
            anchors.topMargin: 10
            anchors.top: parent.top
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 20
            font.styleName: "Regular"
            anchors.leftMargin: 100
            anchors.left: parent.left
            font.family: "SFNS Display"
        }

        Text {
            id: day3
            x: -8
            y: 3
            width: 40
            height: 20
            color: "#ffffff"
            text: weatherhandler.getDay(3)
            verticalAlignment: Text.AlignVCenter
            anchors.topMargin: 10
            anchors.top: parent.top
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 20
            font.styleName: "Regular"
            anchors.leftMargin: 170
            anchors.left: parent.left
            font.family: "SFNS Display"
        }

        Text {
            id: day4
            x: -8
            y: 3
            width: 40
            height: 20
            color: "#ffffff"
            text: weatherhandler.getDay(4)
            verticalAlignment: Text.AlignVCenter
            anchors.topMargin: 10
            anchors.top: parent.top
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 20
            font.styleName: "Regular"
            anchors.leftMargin: 240
            anchors.left: parent.left
            font.family: "SFNS Display"
        }

        Text {
            id: day5
            x: -17
            y: -6
            width: 40
            height: 20
            color: "#ffffff"
            text: weatherhandler.getDay(5)
            verticalAlignment: Text.AlignVCenter
            anchors.topMargin: 10
            anchors.top: parent.top
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 20
            font.styleName: "Regular"
            anchors.leftMargin: 310
            anchors.left: parent.left
            font.family: "SFNS Display"
        }

        Image {
            id: icon1
            width: 50
            height: 40
            anchors.left: parent.left
            anchors.leftMargin: 30
            anchors.top: parent.top
            anchors.topMargin: 36
            source: weatherhandler.getIcon(1)
        }

        Image {
            id: icon2
            width: 50
            height: 40
            anchors.left: parent.left
            anchors.leftMargin: 100
            anchors.top: parent.top
            anchors.topMargin: 36
            source: weatherhandler.getIcon(2)
        }

        Image {
            id: icon3
            x: 4
            y: 6
            width: 50
            height: 40
            source: weatherhandler.getIcon(3)
            anchors.topMargin: 36
            anchors.top: parent.top
            anchors.leftMargin: 170
            anchors.left: parent.left
        }

        Image {
            id: icon4
            x: 3
            y: 10
            width: 50
            height: 40
            source: weatherhandler.getIcon(4)
            anchors.topMargin: 36
            anchors.top: parent.top
            anchors.leftMargin: 240
            anchors.left: parent.left
        }

        Image {
            id: icon5
            x: 12
            y: 10
            width: 50
            height: 40
            source: weatherhandler.getIcon(5)
            anchors.topMargin: 36
            anchors.top: parent.top
            anchors.leftMargin: 310
            anchors.left: parent.left
        }

        Text {
            id: foretemp1
            x: 8
            y: -9
            width: 40
            height: 20
            color: "#ffffff"
            text: weatherhandler.getforeTemp(1)
            verticalAlignment: Text.AlignVCenter
            anchors.topMargin: 82
            anchors.top: parent.top
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 20
            font.styleName: "Regular"
            anchors.leftMargin: 30
            anchors.left: parent.left
            font.family: "SFNS Display"
        }

        Text {
            id: foretemp2
            x: 15
            y: 0
            width: 40
            height: 20
            color: "#ffffff"
            text: weatherhandler.getforeTemp(2)
            verticalAlignment: Text.AlignVCenter
            anchors.topMargin: 82
            anchors.top: parent.top
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 20
            font.styleName: "Regular"
            anchors.leftMargin: 100
            anchors.left: parent.left
            font.family: "SFNS Display"
        }

        Text {
            id: foretemp3
            x: 14
            y: 4
            width: 40
            height: 20
            color: "#ffffff"
            text: weatherhandler.getforeTemp(3)
            verticalAlignment: Text.AlignVCenter
            anchors.topMargin: 82
            anchors.top: parent.top
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 20
            font.styleName: "Regular"
            anchors.leftMargin: 170
            anchors.left: parent.left
            font.family: "SFNS Display"
        }

        Text {
            id: foretemp4
            x: 12
            y: 3
            width: 40
            height: 20
            color: "#ffffff"
            text: weatherhandler.getforeTemp(4)
            verticalAlignment: Text.AlignVCenter
            anchors.topMargin: 82
            anchors.top: parent.top
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 20
            font.styleName: "Regular"
            anchors.leftMargin: 240
            anchors.left: parent.left
            font.family: "SFNS Display"
        }

        Text {
            id: foretemp5
            x: 20
            y: -5
            width: 40
            height: 20
            color: "#ffffff"
            text: weatherhandler.getforeTemp(5)
            verticalAlignment: Text.AlignVCenter
            anchors.topMargin: 82
            anchors.top: parent.top
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 20
            font.styleName: "Regular"
            anchors.leftMargin: 310
            anchors.left: parent.left
            font.family: "SFNS Display"
        }

        Image {
            id: currenticon1
            width: 80
            height: 67
            anchors.top: parent.top
            anchors.topMargin: 125
            anchors.left: parent.left
            anchors.leftMargin: 30
            source: weatherhandler.getcurrIcon()
        }

        Text {
            id: currenttemp1
            width: 80
            height: 50
            color: "#ffffff"
            text: weatherhandler.getcurrTemp()
            font.family: "SFNS Display"
            font.styleName: "Thin"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            anchors.left: parent.left
            anchors.leftMargin: 40
            anchors.top: parent.top
            anchors.topMargin: 207
            font.pixelSize: 68
        }

        Text {
            id: minmaxtemp1
            x: -9
            y: -9
            width: 80
            height: 30
            color: "#ffffff"
            text: weatherhandler.getminmax()
            verticalAlignment: Text.AlignVCenter
            anchors.topMargin: 270
            anchors.top: parent.top
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 30
            anchors.leftMargin: 40
            anchors.left: parent.left
            font.family: "SFNS Display"
            font.styleName: "Thin"
        }

        Text {
            id: currentdesc1
            x: -15
            y: -3
            width: 100
            height: 30
            color: "#ffffff"
            text: weatherhandler.getcurrDesc()
            verticalAlignment: Text.AlignVCenter
            anchors.topMargin: 313
            anchors.top: parent.top
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 40
            anchors.leftMargin: 40
            anchors.left: parent.left
            font.family: "SFNS Display"
            font.styleName: "Thin"
        }

}


/*##^## Designer {
    D{i:4;anchors_x:29;anchors_y:8}D{i:9;anchors_x:29;anchors_y:8}D{i:10;anchors_x:29;anchors_y:8}
D{i:11;anchors_x:29;anchors_y:8}D{i:12;anchors_x:29;anchors_y:8}D{i:14;anchors_x:30;anchors_y:36}
D{i:15;anchors_x:100;anchors_y:36}D{i:16;anchors_x:100;anchors_y:36}D{i:17;anchors_x:100;anchors_y:36}
D{i:18;anchors_x:100;anchors_y:36}D{i:19;anchors_x:29;anchors_y:8}D{i:20;anchors_x:29;anchors_y:8}
D{i:21;anchors_x:29;anchors_y:8}D{i:22;anchors_x:29;anchors_y:8}D{i:23;anchors_x:29;anchors_y:8}
D{i:25;anchors_x:10;anchors_y:108}D{i:26;anchors_x:10;anchors_y:175}D{i:27;anchors_x:10;anchors_y:175}
D{i:28;anchors_x:10;anchors_y:175}D{i:2;anchors_height:200;anchors_width:200;anchors_x:100;anchors_y:100}
}
 ##^##*/
