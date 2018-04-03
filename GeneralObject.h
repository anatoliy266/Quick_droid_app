#ifndef WIDGET_H
#define WIDGET_H

#include <QWidget>

class GeneralObject : public QObject
{
    Q_OBJECT

public:
    explicit GeneralObject(QObject *parent = 0);
    ~GeneralObject();


};

#endif // WIDGET_H
