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
    void getUsers();
signals:
    void recieveUsername(QString uRecived);
    void recieveCount(int count);
    void getUsersList(QStringList usersList);
public slots:
    void getUsername(QString user);
    void userNameList();
    void delUser(int id);
private:
    QSqlDatabase db;
    int count;
    QStringList uList;
};



#endif // WIDGET_H
