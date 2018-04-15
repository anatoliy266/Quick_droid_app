#ifndef CHEKPATH_H
#define CHEKPATH_H

#include <QObject>

class chekPath : public QObject
{
    Q_OBJECT
public:
    explicit chekPath(QObject *parent = nullptr);
    ~chekPath();
    QString path();
signals:
public slots:
    void getPath(QString path);
private:
    QString ImPath;
};

#endif // CHEKPATH_H
