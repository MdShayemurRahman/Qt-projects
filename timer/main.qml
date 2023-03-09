import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Timer")



    Rectangle{
        id:page

        gradient: Gradient {
                 GradientStop { position: 0; color: "red" }
                 GradientStop { position: 1; color: "yellow" }
        }
        anchors.fill: parent
        rotation: 90;
        Text {
            text: "sayem!!"
        }
    }
}
