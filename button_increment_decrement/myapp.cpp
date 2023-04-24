#include "myapp.h"
#include <QDebug>
#include <QtMultimedia/QMediaPlayer>
#include <QMediaPlaylist>

int val = 0;
int init = 0;
QMediaPlayer* mediaPlayer = new QMediaPlayer;
QMediaPlaylist* playlist = new QMediaPlaylist;

myapp::myapp(QObject *parent):
    QObject(parent)

{
    mediaPlayer = new QMediaPlayer;
//    connect(mediaPlayer, SIGNAL(positionChanged()), this, SLOT(mySlot()));

    playlist->addMedia(QUrl::fromLocalFile("C:/Users/jahed/MdShayemurRahman-github/Qt-Projects/button_increment_decrement/inc.wav"));
    playlist->addMedia(QUrl::fromLocalFile("C:/Users/jahed/MdShayemurRahman-github/Qt-Projects/button_increment_decrement/dec.wav"));
    playlist->addMedia(QUrl::fromLocalFile("C:/Users/jahed/MdShayemurRahman-github/Qt-Projects/button_increment_decrement/start.wav"));
    playlist->addMedia(QUrl::fromLocalFile("C:/Users/jahed/MdShayemurRahman-github/Qt-Projects/button_increment_decrement/stop.wav"));

}


void myapp::mySlot() {

}


void myapp::func_btn_clk()
{

    init++;
    val = 0;
    emit sendMess("Reset");
    emit sendMess2(QString::number(val));
    mediaPlayer->setMedia(playlist->media(3));
    mediaPlayer->play();
}
void myapp::func_btn_pls()
{
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








