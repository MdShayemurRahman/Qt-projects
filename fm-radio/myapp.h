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
    void sendMess(const QString &txt_box_str);
public slots:
    void MySlot();
    void func_btn_off();
    void func_btn_ch1();
    void func_btn_ch2();
    void func_btn_ch3();
    void func_btn_inc();
    void func_btn_dec();
};


#endif // MYAPP_H
