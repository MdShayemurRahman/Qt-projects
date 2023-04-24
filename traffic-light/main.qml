import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 200
    height: 400
    visible: true
    title: "Traffic Light"

    Rectangle {
        id: mainRectangle
        width: 400
        height: 400
        color: "lightgray"

        Rectangle {
            id: horizontalRoad
            width: 300
            height: 80
            x: 50
            y: 160
            color: "gray"
        }

        Rectangle {
            id: verticalRoad
            width: 80
            height: 300
            x: 160
            y: 50
            color: "gray"
        }

        Rectangle {
            id: horizontalTrafficLight
            width: 40
            height: 120
            x: 130
            y: 140
            color: "black"
            border.color: "yellow"
            border.width: 3

            Rectangle {
                id: horizontalGreenLight
                width: 30
                height: 30
                x: 5
                y: 85
                radius: 15
                color: "green"
                visible: trafficLightModel.horizontalLight === "green"
            }

            Rectangle {
                id: horizontalYellowLight
                width: 30
                height: 30
                x: 5
                y: 45
                radius: 15
                color: "yellow"
                visible: trafficLightModel.horizontalLight === "yellow"
            }

            Rectangle {
                id: horizontalRedLight
                width: 30
                height: 30
                x: 5
                y: 5
                radius: 15
                color: "red"
                visible: trafficLightModel.horizontalLight === "red"
            }
        }

        Rectangle {
            id: verticalTrafficLight
            width: 120
            height: 40
            x: 140
            y: 130
            color: "black"
            border.color: "yellow"
            border.width: 3

            Rectangle {
                id: verticalGreenLight
                width: 30
                height: 30
                x: 85
                y: 5
                radius: 15
                color: "green"
                visible: trafficLightModel.verticalLight === "green"
            }

            Rectangle {
                id: verticalYellowLight
                width: 30
                height: 30
                x: 45
                y: 5
                radius: 15
                color: "yellow"
                visible: trafficLightModel.verticalLight === "yellow"
            }

            Rectangle {
                id: verticalRedLight
                width: 30
                height: 30
                x: 5
                y: 5
                radius: 15
                color: "red"
                visible: trafficLightModel.verticalLight === "red"
            }
        }

        ListModel {
            id: trafficLightModel
            ListElement { horizontalLight: "green"; verticalLight: "red" }
        }

        Timer {
               id: timer
               interval: 3000
               running: true
               repeat: true
//               onTriggered: {
//                   if (trafficLightModel.horizontalLight === "green") {
//                       trafficLightModel.set(0, { horizontalLight: "yellow", verticalLight: "red" })
//                   } else if (trafficLightModel.horizontalLight === "yellow") {
//                       trafficLightModel.set(0, { horizontalLight: "red", verticalLight: "green" })
//                   } else if () {

//                   }
//               }
        }
    }

}
