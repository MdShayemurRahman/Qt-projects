import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15


Window {
    width: 450
    height: 450
    visible: true
    title: qsTr("Counter")

    Text {
        id: txt_box
        text: ("Qt Project")
        anchors.verticalCenterOffset: -200
        anchors.horizontalCenterOffset: 0
        anchors.centerIn: parent
        font.pointSize: 24
    }
    Text {
        id: txt_box2
        text: ("0")
        anchors.verticalCenterOffset: -150
        anchors.horizontalCenterOffset: 0
        anchors.centerIn: parent
        font.pointSize: 12
    }
    Button
    {
        id: button2
        text: qsTr("+")
        anchors.verticalCenterOffset: -100
        anchors.horizontalCenterOffset: -120
        anchors.centerIn: parent
        onClicked:
        {
            myapp.func_btn_pls()
        }
    }
    Button
    {
        id: button
        text: qsTr("My Button")
        anchors.verticalCenterOffset: -100
        anchors.horizontalCenterOffset: 0
        anchors.centerIn: parent
        onClicked:
        {
            myapp.func_btn_clk()
        }
    }

    Button
    {
        id: button3
        text: qsTr("-")

        anchors.verticalCenterOffset: -100
        anchors.horizontalCenterOffset: 120
        anchors.centerIn: parent
        onClicked:
        {
            myapp.func_btn_mns()
        }
    }

    Connections
    {
        target:myapp
        ignoreUnknownSignals: true

        function onSendMess(text_box_str)
        {
            txt_box.text = text_box_str
        }
        function onSendMess2(text_box_str2)
        {
             txt_box2.text = text_box_str2
        }
    }
}
