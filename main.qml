import QtQuick 2.5
import QtQuick.Window 2.2

import screenBrightness 1.0

Window {
    visible: true

    width: 800
    height: 480
    title: qsTr("Uptane Demo")
    visibility: "FullScreen"

    MainForm {
        sliderVertical1.onValueChanged: {
            onValueChanged: brightness.setBrightness(sliderVertical1.value);
            //text1.text = sliderVertical1.value;
        }

        anchors.fill: parent

        ScreenBrightness {
            id: brightness;
        }

        Flipable {
            id: image
            x: 120
            y: 380
            width: 70
            height: 30
            MouseArea {
                width: back_image.width;
                height: back_image.height;
                onClicked: image.flipped = !image.flipped;


            }


            property bool flipped: false
            front: Image { source: "logo.png"; anchors.centerIn: parent }
            back: Image { id: back_image; source: "logo_back.png"; anchors.centerIn: parent }

            transform: Rotation {
                id: rotation
                origin.x: image.width/2
                origin.y: image.height/2
                axis.x: 0; axis.y: 1; axis.z: 0     // set axis.y to 1 to rotate around y-axis
                angle: 0    // the default angle
            }
            states: State {
                name: "back"
                PropertyChanges { target: rotation; angle: 180 }
                when: image.flipped
            }
            transitions: Transition {
                NumberAnimation { target: rotation; property: "angle"; duration: 4000 }
            }
        }

    }


}
