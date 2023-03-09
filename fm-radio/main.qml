import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtMultimedia 5.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("FM RADIO")


    Column {
        anchors.verticalCenter: parent.verticalCenter;
        anchors.horizontalCenter: parent.horizontalCenter;


        MediaPlayer {
            id: mediaPlayer
            source: "file:///C:/Users/jahed/MdShayemurRahman-github/Qt-Projects/fm-radio/music.mp3"
            autoPlay: true
        }

        Rectangle {
            width: 150
            height: 30
            Text {
                id: txt_box
                text: qsTr("95.7")
                font.pointSize: 12
                anchors.centerIn: parent
            }
            border.width: 2
            border.color: "black"
        }

        Slider {
            id: slider_1
            from: 88.0
            to: 107.0
            value: txt_box.text
            onMoved: {
                if (off.checked) {
                    value = previousValue;
                } else {
                    if (value > txt_box.text) {
                        mediaPlayer.stop();
                        mediaPlayer.play();
                        myapp.func_btn_inc();
                    } else {
                        mediaPlayer.stop();
                        mediaPlayer.play();
                        myapp.func_btn_dec();
                    }
                    previousValue = value;
                }

            }
        }



        Row {
            Button {
                id: btn_1
                width: 80;
                height: 50;
                text: "< "
                background: Rectangle {
                        color: "gray"
                }
                onPressed: background.color = "red";
                onReleased: background.color = "gray";
                onClicked: {
                    if(RadioButton.id === off || txt_box.text === "OFF") {
                        mediaPlayer.stop();
                    }
                    else {
                        mediaPlayer.stop();
                        mediaPlayer.play();
                    }
                    myapp.func_btn_dec()
                }
            }

            Button {
                id: btn_2
                width: 80;
                height: 50;
                text: " >"
                background:
                    Rectangle {
                        color: "gray"
                    }
                onPressed: background.color = "red";
                onReleased: background.color = "gray";
                onClicked: {
                    myapp.func_btn_inc();
                    if(RadioButton.id === off || txt_box.text === "OFF") {
                        mediaPlayer.stop();
                    }
                    else {
                        mediaPlayer.stop();
                        mediaPlayer.play();

                    }

                }
            }
        }

        Row {
            RadioButton {
                id: off
                checked: false
                text: qsTr("Off")
                font.pointSize: 12
                onClicked:
                {
                    mediaPlayer.stop();
                    myapp.func_btn_off()
                }
            }
            RadioButton {
                id: ch1
                checked: true
                text: qsTr("CH1")
                font.pointSize: 12
                onClicked:
                {
                    mediaPlayer.stop();
                    mediaPlayer.play();
                    myapp.func_btn_ch1()
                }
            }

            RadioButton {
                id: ch2
                checked: false
                text: qsTr("CH2")
                font.pointSize: 12
                onClicked: {
                    mediaPlayer.stop();
                    mediaPlayer.play();
                    myapp.func_btn_ch2()
                }
            }
            RadioButton {
                id: ch3
                checked: false
                text: qsTr("CH3")
                font.pointSize: 12
                onClicked: {
                    mediaPlayer.stop();
                    mediaPlayer.play();
                    myapp.func_btn_ch3()
                }
            }
        }

        Connections
        {
            target:myapp
            ignoreUnknownSignals: true

            function onSendMess(text_box_str)
            {
                txt_box.text = text_box_str;
            }
        }
    }


}
