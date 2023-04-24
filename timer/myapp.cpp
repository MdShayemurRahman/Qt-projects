#include "myapp.h"
#include <QDebug>
#include <QtCore>
#include <QTimer>
#include <QtMultimedia/QMediaPlayer>
#include <QDateTime>
#include <QMediaPlaylist>

int val = 0;
int init = 0;
bool timerStarter = false;

QMediaPlayer* mediaPlayer = new QMediaPlayer;
QMediaPlaylist* playlist = new QMediaPlaylist;

myapp::myapp(QObject *parent):
    QObject(parent)

{
    mediaPlayer = new QMediaPlayer;

    playlist->addMedia(QUrl::fromLocalFile("C:/Users/jahed/MdShayemurRahman-github/Qt-Projects/button_increment_decrement/inc.wav"));
    playlist->addMedia(QUrl::fromLocalFile("C:/Users/jahed/MdShayemurRahman-github/Qt-Projects/button_increment_decrement/dec.wav"));
    playlist->addMedia(QUrl::fromLocalFile("C:/Users/jahed/MdShayemurRahman-github/Qt-Projects/button_increment_decrement/start.wav"));
    playlist->addMedia(QUrl::fromLocalFile("C:/Users/jahed/MdShayemurRahman-github/Qt-Projects/button_increment_decrement/stop.wav"));


    QTimer *timer = new QTimer(this);
    connect(timer, SIGNAL(timeout()), this, SLOT(mySlot()));
    timer->start(1000);

}


void myapp::mySlot() {
    if(timerStarter == true) {

        val++;
        emit sendMess("Timer Running!");
        emit sendMess2(QString::number(val));
        mediaPlayer->setMedia(playlist->media(2));
        mediaPlayer->play();
    }
}


void myapp::func_btn_reset()
{
    timerStarter = false;
    val = 0;
    emit sendMess("Reset");
    emit sendMess2(QString::number(val));
    mediaPlayer->setMedia(playlist->media(3));
    mediaPlayer->play();
}

void myapp::func_btn_start()
{
    timerStarter = true;

}

void myapp::func_btn_stop()
{
    timerStarter = false;
    emit sendMess("Timer stopped!");
}

void myapp::func_btn_pls()
{
    timerStarter = false;
    val++;
    emit sendMess("Increment");
    emit sendMess2(QString::number(val));
    qDebug() << "Increment";

    if(val != 0) {
        mediaPlayer->setMedia(playlist->media(0));
        mediaPlayer->play();
    } else {
        mediaPlayer->setMedia(playlist->media(3));
        mediaPlayer->play();
    }

}
void myapp::func_btn_mns()
{
    timerStarter = false;
    val--;
    emit sendMess("Decrement");
    emit sendMess2(QString::number(val));
    qDebug() << "Decrement";

    if(val != 0) {
        mediaPlayer->setMedia(playlist->media(1));
        mediaPlayer->play();
    } else {
        mediaPlayer->setMedia(playlist->media(3));
        mediaPlayer->play();
    }
}








