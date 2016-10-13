import QtQuick 2.5
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4

Rectangle {

    width: 800
    height: 480
    color: "#0a0131"
    property alias text1: text1
    property alias channelcount: channelcount
    property alias sliderVertical1: sliderVertical1


    MouseArea {
        id: mouseArea
        width: 800
        height: 480
        z: 3
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor

        Slider {
            id: sliderVertical1
            x: 743
            y: 77
            width: 22
            height: 337
            value: 65
            minimumValue: 10
            maximumValue: 255
            orientation: Qt.Vertical
        }
    }

    Text {
        id: text1
        x: 586
        y: 439
        width: 214
        height: 41
        color: "#ccd1d1d3"
        text: "Uptane Demo"
        font.bold: false
        z: 1
        verticalAlignment: Text.AlignBottom
        horizontalAlignment: Text.AlignRight
        font.pixelSize: 27
        font.family: "daniel"

    }

    Image {
        id: image1
        width: 800
        height: 480
        opacity: 1
        fillMode: Image.PreserveAspectFit
        source: "background.png"
    }

    Text {
        id: channelcount
        x: 439
        y: 213
        text: ".."
        font.family: "Courier"
        font.pixelSize: 12
    }


}
