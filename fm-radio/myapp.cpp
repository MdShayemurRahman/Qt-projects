#include "myapp.h"
#include <QtCore>
#include <QDebug>

double ch1 = 95.7;
double ch2 = 99.0;
double ch3 = 104.2;

bool one = true;
bool two = false;
bool three = false;

myapp::myapp()
{
    timer = new QTimer(this);
    connect(timer, SIGNAL(timeout()), this, SLOT(MySlot()));
    timer->start(1000);

}
void myapp::MySlot(){
   // qDebug()<<"clicked";
}
void myapp::func_btn_off()
{
    emit sendMess("OFF");
    one = false;
    two = false;
    three = false;

}
void myapp::func_btn_ch1()
{
    emit sendMess(QString::number(ch1));

    one = true;
    two = false;
    three = false;

}
void myapp::func_btn_ch2()
{
    emit sendMess(QString::number(ch2));
    two = true;
    one = false;
    three = false;
}
void myapp::func_btn_ch3()
{
    emit sendMess(QString::number(ch3));
    three = true;
    one = false;
    two = false;
}

void myapp::func_btn_inc()
{
    if(one == true){
        ch1 = ch1 + 0.1;
         emit sendMess(QString::number(ch1));
    } else if(two == true){
        ch2 = ch2 + 0.1;
         emit sendMess(QString::number(ch2));
    } else if(three == true){
        ch3 = ch3 + 0.1;
         emit sendMess(QString::number(ch3));
    }

}
void myapp::func_btn_dec()
{
    if(one == true){
        ch1 = ch1 - 0.1;
         emit sendMess(QString::number(ch1));
    } else if(two == true){
        ch2 = ch2 - 0.1;
         emit sendMess(QString::number(ch2));
    } else if(three == true){
        ch3 = ch3 - 0.1;
         emit sendMess(QString::number(ch3));
    }

}
