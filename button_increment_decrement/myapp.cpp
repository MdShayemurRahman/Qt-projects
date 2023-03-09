#include "myapp.h"
#include <QDebug>

int val = 0;
myapp::myapp(QObject *parent):
    QObject(parent)

{

}
void myapp::func_btn_clk()
{
    emit sendMess("Hello World");
    qDebug() << "Button Pressed";

}
void myapp::func_btn_pls()
{
    val++;
    emit sendMess2(QString::number(val));
    qDebug() << "Increment";
}
void myapp::func_btn_mns()
{
    val--;
    emit sendMess2(QString::number(val));
    qDebug() << "Decrement";
}








