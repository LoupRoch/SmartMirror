import QtQuick 2.11
import QtQuick.Window 2.11

Window {
    visible: true
    width: 1080
    height: 1920
    title: qsTr("Hello World")

    Rectangle {
        id: background
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        gradient : Gradient{
            GradientStop {position: 0.0;color:"#6b6b6b"}
            GradientStop {position: 1.0;color:"white"}
        }

        NotesreceiverForm {
            id: notesreceiverForm
            y: 760
            anchors.verticalCenterOffset: 150
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 40
        }
    }

    HourForm {
        id: hourForm
        x: 1450
        y: 1050
        anchors.right: parent.right
        anchors.rightMargin: 50
        anchors.top: parent.top
        anchors.topMargin: 50
    }

    WeatherForm {
        id: weatherForm
        x: 1450
        y: 470
        anchors.left: parent.left
        anchors.leftMargin: 50
        anchors.top: parent.top
        anchors.topMargin: 50
    }
}

/*##^## Designer {
    D{i:7;anchors_x:0}D{i:2;anchors_height:200;anchors_width:200;anchors_x:440;anchors_y:860}
}
 ##^##*/
