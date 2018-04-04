#ifndef WIDGET_H
#define WIDGET_H

#include <QObject>
#include <QApplication>
#include <QtSql>
#include <QSqlQuery>
#include <QMessageBox>
#include <QSqlRecord>
#include <QSqlField>
#include <QList>

class GeneralObject : public QObject
{
    Q_OBJECT

public:
    explicit GeneralObject(QObject *parent = 0);
    ~GeneralObject();
signals:
    void recieveUsername(QString uRecived);
public slots:
    void getUsername(QString user);
private:
    QSqlDatabase db;

};

#endif // WIDGET_H
