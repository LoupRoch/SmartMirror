import QtQuick 2.4

Item {
    id: item1
    width: 400
    height: 400

    Text {
        id: notestitle
        x: 125
        width: 400
        height: 40
        text: qsTr("Notes :")
        font.family: "SFNS Display"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 8
        font.pixelSize: 40
    }

    Text {
        id: notesbox
        objectName: "notesbox"
        x: 0
        y: 100
        width: 400
        height: 300
        text: qsTr("Test")
        font.family: "SFNS Display"
        font.styleName: 'Thin'
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 25
    }
}

/*##^## Designer {
    D{i:2;anchors_y:8}
}
 ##^##*/
