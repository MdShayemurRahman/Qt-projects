import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15

Window {
    visible: true
    width: 340
    height: 200
    title: qsTr("Digital Alarm Clock")

    FontLoader { id: webFont; source: "file:///C:/Fonts/digital-7.ttf"}

    Rectangle {
        anchors.centerIn: parent;
        border.color: "black"
        border.width: 2

        Column {
            spacing: 20
            anchors.centerIn: parent;

            // Define the clock display row
            Row {
                spacing: 10

                // Display the clock time
                Row {
                    Text {
                        id: hr
                        text: "01"
                        font.family: webFont.name
                        font.pixelSize: 50
                    }
                    Text {
                        id: colhr
                        text: ":"
                        font.family: webFont.name
                        font.pixelSize: 50
                    }
                    Text {
                        id: min
                        text: "02"
                        font.family: webFont.name
                        font.pixelSize: 50
                    }
                    Text {
                        id: colmin
                        text: ":"
                        font.family: webFont.name
                        font.pixelSize: 50
                    }
                    Text {
                        id: sec
                        text: "03"
                        font.family: webFont.name
                        font.pixelSize: 50
                    }
                }
            }

            Row {
                spacing: 3;

                Text {
                    id: date
                    text: "05"
                    font.family: webFont.name
                    font.pixelSize: 20
                }
                Text {
                    id: seperatorDate
                    text: "/"
                    font.family: webFont.name
                    font.pixelSize: 20
                }
                Text {
                    id: month
                    text: "07"
                    font.family: webFont.name
                    font.pixelSize: 20
                }
                Text {
                    id: seperatorMonth
                    text: "/"
                    font.family: webFont.name
                    font.pixelSize: 20
                }
                Text {
                    id: year
                    text: "2023"
                    font.family: webFont.name
                    font.pixelSize: 20
                }

                // Display the alarm time
                Row {
                    spacing: 2;

                    Text {
                        text: "    Alarm-";
                        font.family: webFont.name
                        font.pixelSize: 12
                    }

                    Text {
                        id: alHr
                        text: "hh"
                        font.family: webFont.name
                        font.pixelSize: 12
                    }

                    Text {
                        text: ":"
                        font.family: webFont.name
                        font.bold: true
                    }

                    Text {
                        id: alMin
                        text: "mm"
                        font.family: webFont.name
                        font.pixelSize: 12
                    }
                }

            }


            // Define the buttons row
            Row {
                spacing: 10

                // Define the set alarm button
                Button {
                    text: "Set Time"
                    width: 70;
                    onClicked:{
                        myapp.setTime()
                    }
                }
                Button {

                    text: "Set Alarm"
                    width: 70
                    onClicked:{
                        myapp.setAlarm()
                    }
                }

                Button {
                    id: snoozeBtn;
                    text: "Alarm stop"
                    width: 70;
                    onClicked:{
                        myapp.btnSnooze()
                    }
                }

                // Define the time adjust buttons
                Column {
                    spacing: 5
                    Button {
                        height: 18;
                        width: 40;
                        font.pointSize: 6
                        text: "Up"
                        onClicked:{
                            myapp.btnUp()
                        }
                    }
                    Button {
                        height: 18;
                        width: 40;
                        font.pointSize: 6
                        text: "Down"
                        onClicked:{
                            myapp.btnDown()
                        }
                    }
                }
            }
        }
    }

    Connections {
        target: myapp
        ignoreUnknownSignals: true

        function onSendHour(text_box_str)
        {
            hr.text = text_box_str;
        }
        function onSendMin(text_box_str)
        {
            min.text = text_box_str;
        }
        function onSendSec(text_box_str)
        {
            sec.text = text_box_str;
        }
        function onSendDate(text_box_str)
        {
            date.text = text_box_str;
        }
        function onSendMonth(text_box_str)
        {
            month.text = text_box_str;
        }
        function onSendYear(text_box_str)
        {
            year.text = text_box_str;
        }
        function onSendAlarmHr(text_box_str)
        {
            alHr.text = text_box_str;
        }
        function onSendAlarmMin(text_box_str)
        {
            alMin.text = text_box_str;
        }
    }
}
