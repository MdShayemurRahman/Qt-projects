import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    visible: true
    width: 800
    height: 600

    Rectangle {
        anchors.fill: parent


        // Traffic Light 1
        Rectangle {
            x: 425
            y: 320
            width: 30
            height: 90
            color: "black"

            Rectangle {
                x: 5
                y: 5
                width: 20
                height: 20
                radius: 20
                color: "green"
                visible: trafficLightMode === 1
            }

            Rectangle {
                x: 5
                y: 35
                width: 20
                height: 20
                radius: 20
                color: "yellow"
                visible: trafficLightMode === 2
            }

            Rectangle {
                x: 5
                y: 65
                width: 20
                height: 20
                radius: 20
                color: "red"
                visible: trafficLightMode === 3
            }
        }

        // Traffic Light 2
        Rectangle {
            x: 425
            y: 240
            width: 90
            height: 30
            color: "black"

            Rectangle {
                x: 5
                y: 5
                width: 20
                height: 20
                radius: 20
                color: "green"
                visible: trafficLightMode === 3
            }

            Rectangle {
                x: 35
                y: 5
                width: 20
                height: 20
                radius: 20
                color: "yellow"
                visible: trafficLightMode === 2
            }

            Rectangle {
                x: 65
                y: 5
                width: 20
                height: 20
                radius: 20
                color: "red"
                visible: trafficLightMode === 1
            }
        }

        // Road
        Rectangle {
            x: 100
            y: 275
            width: 600
            height: 35
            color: "grey"
        }
        Rectangle {
            x: 385
            y: 100
            width: 35
            height: 400
            color: "grey"
        }


    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            if (isDarkMode) { // check if dark mode is enabled
                if (trafficLightMode === 2)
                    trafficLightMode = 0;

            } else { // normal operation
                if (trafficLightMode === 1)
                    trafficLightMode = 2;
                else if (trafficLightMode === 2)
                    trafficLightMode = 3;
                else
                    trafficLightMode = 1;
            }
        }
    }

    property int trafficLightMode: 1
    property bool isDarkMode: false

    Button {
        id: on;
        text: "Turn Light"
        x: 0
        y: 0;
        onClicked: {
            trafficLightMode = 1
            state.text = "Traffic System Running"
            isDarkMode = false
        }
    }

    Button {
        id: off;
        text: "OFF"
        x: 120
        y: 0

        onClicked: {
            trafficLightMode = 0
            state.text = "Off"
            isDarkMode = true
        }
    }

    Text {
        id: state
        text: "Traffic System Running"
        x: 5
        y: 50
        font.pixelSize: 18
    }
}
