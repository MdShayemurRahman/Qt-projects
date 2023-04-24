import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Text Application")

    Column {
        Row {
            TextInput {
                id: input_field;
                width: 150
                height: 30
            }
            Button {
                id: btn;
                text: "Submit";

            }
            Rectangle {
                width: 150
                height: 30
                Text {
                    id: txt_box
                    text: input_field.text;
                    font.pointSize: 12
                    anchors.centerIn: parent
                }
                border.width: 2
                border.color: "black"
            }
        }
    }


}
