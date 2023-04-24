#ifndef MYAPP_H
#define MYAPP_H
#include <QtCore>
#include <QDebug>

class myapp : public QObject
{
    Q_OBJECT
public:
    myapp();
    QTimer *timer;
signals:
    void sendMin(const QString &min);
    void sendHour(const QString &hr);
    void sendSec(const QString &sec);
    void sendDate(const QString &date);
    void sendMonth(const QString &month);
    void sendYear(const QString &year);
    void sendAlarmHr(const QString &hr);
    void sendAlarmMin(const QString &min);
public slots:
    void mySlot();
    void setTime();
    void setAlarm();
    void btnUp();
    void btnDown();
    void btnSnooze();
};

#endif // MYAPP_H
