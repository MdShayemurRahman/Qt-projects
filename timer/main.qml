import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15


Window {
    width: 450
    height: 450
    visible: true
    title: qsTr("Counter")


    Rectangle {
        anchors.centerIn: parent;
        border.color: "black"
        border.width: 2

        Column {
            spacing: 20
            anchors.centerIn: parent;


            Row {
                spacing: 10

                Text {
                    id: txt_box
                    text: ("Qt Project")
                    font.pointSize: 32
                }

            }

            Row {
                spacing: 10

                Text {
                    id: txt_box2
                    text: ("0")
                    font.pointSize: 24
                }
            }




            // Define the buttons row
            Row {
                spacing: 10

                // Define the set alarm button
                Button
                {
                    id: plusBtn
                    text: qsTr("+")
                    width: 70;
                    height: 64;
                    onClicked:
                    {
                        myapp.func_btn_pls()
                    }
                }




                // Define the time adjust buttons
                Column {
                    spacing: 5
                    Button
                    {
                        id: resetBtn
                        text: qsTr("Reset")
                        height: 18;
                        width: 60;
                        onClicked:
                        {
                            myapp.func_btn_reset()
                        }
                    }
                    Button
                    {
                        id: startBtn
                        text: qsTr("Start")
                        height: 18;
                        width: 60;
                        onClicked:
                        {
                            myapp.func_btn_start()
                        }
                    }

                    Button
                    {
                        id: startStop
                        text: qsTr("Stop")
                        height: 18;
                        width: 60;
                        onClicked:
                        {
                            myapp.func_btn_stop()
                        }
                    }
                }


                Button
                {
                    id: minusBtn
                    text: qsTr("-")
                    width: 70;
                    height: 64;
                    onClicked:
                    {
                        myapp.func_btn_mns()
                    }
                }

            }
        }
    }





    Row {

    }

    Row {
        Button
        {
            id: timerStart
            text: qsTr("Timer")
            anchors.verticalCenterOffset: -120
            anchors.horizontalCenterOffset: 0
            anchors.centerIn: parent
            //            onClicked:
            //            {
            //                myapp.func_btn_mns()
            //            }
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
