#include <QObject>
class myapp : public QObject
{
    Q_OBJECT

public:
    explicit myapp(QObject * parent = 0);

signals:
    void sendMess(const QString &txt_box_str);
    void sendMess2(const QString &txt_box_str2);

public slots:
    void mySlot();
    void func_btn_reset();
    void func_btn_start();
    void func_btn_stop();
    void func_btn_pls();
    void func_btn_mns();

};

