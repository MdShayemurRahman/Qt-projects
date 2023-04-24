#include "myapp.h"
#include <QtCore>
#include <QDebug>
#include <QDateTime>
#include <QtMultimedia/QMediaPlayer>

QMediaPlayer* mediaPlayer = new QMediaPlayer;
int hour, minute, second, milliSec = 0;
int alHour, alMinute = 0;
int day, month, year = 0;
int init, change = 0;

bool setTimeStarter = false;
bool setAlarmStarter = false;
bool alarm = false;
bool alarmSound = false;

myapp::myapp()
{
    mediaPlayer->setMedia(QUrl::fromLocalFile("C:/Users/jahed/MdShayemurRahman-github/Qt-Projects/alarm-clock/alarmSound.wav"));
    QTime time = QTime::currentTime();
    QDate date = QDate::currentDate();
    hour = time.hour();
    minute = time.minute();
    second = time.second();
    milliSec = time.msec();
    day = date.day();
    month = date.month();
    year = date.year();

    alHour = hour;
    alMinute = minute;

    timer = new QTimer(this);
    connect(timer, SIGNAL(timeout()), this, SLOT(mySlot()));
    timer->start(1000);
}

void myapp::mySlot()
{
    init++;
    second++;

    emit sendMin(QString::number(minute));
    emit sendHour(QString::number(hour));
    emit sendSec(QString::number(second));
    emit sendDate(QString::number(day));
    emit sendMonth(QString::number(month));
    emit sendYear(QString::number(year));

    if(minute < 10){
        emit sendMin("0" + (QString::number(minute)));
    }

    if(hour < 10){
        emit sendHour("0" + (QString::number(hour)));
    }

    if(second < 10000){
        emit sendSec((QString::number(second)));
    }

    if(second < 10) {
        emit sendSec("0" + (QString::number(second)));
    }

    if(second == 60) {
        second= 0;
    }

    if(hour == 24) {
        hour = 0;
    }

    if(hour < 0) {
        hour = 23;
    }

    if(minute == 60){
        minute = 0;

        if(hour < 24) {
            hour += 1;
        }
    }

    if(minute < 0) {
        minute = 59;
        if(hour > 0) {
            hour -= 1;
        }
    }

    if(second == 60){
        second = 0;
    }

    if(alHour == 24){
        alHour = 0;
    }

    if(alHour < 0){
        alHour = 23;
    }

    if(alMinute == 60){
        alMinute = 0;
    }

    if(alMinute < 0){
        alMinute = 59;
    }

    /// set time blink on time...
    if(setTimeStarter == true) {
        if(change == 1) {
            if(init % 2 == 1) {
                emit sendHour(QString("   "));

            } else {
                if(hour < 10) {
                    emit sendHour("0" + QString::number(hour));
                } else {
                    emit sendHour(QString::number(hour));
                }
            }
        }
        if(change == 2) {
            if(init % 2 == 0) {
                emit sendMin(QString("   "));

            } else {
                if(minute < 10) {
                    emit sendMin("0" + QString::number(minute));
                } else {
                    emit sendMin(QString::number(minute));
                }
            }
        }
        if(change == 3) {
            if(init % 2 == 1) {
                emit sendSec(QString("   "));
            } else {
                if(second < 10) {
                    emit sendSec("0" + QString::number(second));
                } else {
                    emit sendSec(QString::number(second));
                }
            }
        }
    }


    /// set Alarm blink on time...
    if(setAlarmStarter == true) {
        if(change == 1) {
            if(init %2 == 1) {
                emit sendAlarmHr(QString(" "));
            } else {
                emit sendAlarmHr(QString::number(alHour));
            }
        }

        if(change == 2) {
            if(init %2 == 0) {
                emit sendAlarmMin(QString(" "));
            } else {
                emit sendAlarmMin(QString::number(alMinute));
            }
        }
    }

    /// Ring alarm
    if(hour == alHour && minute == alMinute && alarm == true) {
        if(init %2 == 1) {
            emit sendAlarmHr(QString(" "));
            emit sendAlarmMin(QString(" "));
        } else {
            emit sendAlarmHr(QString::number(alHour));
            emit sendAlarmMin(QString::number(alMinute));
        }
        mediaPlayer->play();
    }
}

void myapp::setTime()
{
    setAlarmStarter = false;
    change += 1;

    setTimeStarter = true;
    init = 0;


    emit sendHour(QString::number(hour));
    emit sendMin(QString::number(minute));


    if(change == 4){
        change = 0;
        setTimeStarter = false;
    }
}

void myapp::setAlarm()
{
    setTimeStarter = false;
    change += 1;

    setAlarmStarter = true;
    init = 0;

    emit sendAlarmHr(QString::number(alHour));
    emit sendAlarmMin(QString::number(alMinute));


    if(change == 3){
        change = 0;
        setAlarmStarter = false;
        alarm = true;
    }
}

void myapp::btnUp()
{
    init = 0;
    if(setTimeStarter == true) {
        if(change == 1) {
            hour +=1;
        } else if(change == 2) {
            minute +=1;
        } else if(change == 3 ) {
            second = 0;
        }
    }

    if(setAlarmStarter == true) {
        if(change == 1) {
            alHour +=1;
        } else if(change == 2) {
            alMinute +=1;
        } else if(change == 3 ) {
            emit sendAlarmHr(QString::number(alHour));
            emit sendAlarmMin(QString::number(alMinute));
        }
    }

}

void myapp::btnDown()
{
    init = 0;
    if(setTimeStarter == true) {
        if(change == 1) {
            hour -=1;
        } else if(change == 2) {
            minute -=1;
        } else if(change == 3 ) {
            second = 0;
        }
    }

    if(setAlarmStarter == true) {
        if(change == 1) {
            alHour -=1;
        } else if(change == 2) {
            alMinute -=1;
        } else if(change == 3 ) {
            emit sendAlarmHr(QString::number(alHour));
            emit sendAlarmMin(QString::number(alMinute));
        }
    }
}

void myapp::btnSnooze()
{
    alarm = false;
    mediaPlayer->stop();
    emit sendAlarmHr(QString("HH"));
    emit sendAlarmMin(QString("MM"));
}
