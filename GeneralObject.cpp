#include "GeneralObject.h"
#include <QDebug>

GeneralObject::GeneralObject(QObject *parent) :
    QObject(parent)
{
    QFile dbfile("./easy.db");
    if (!dbfile.exists()) {
        QFile dfile("assets:/easy.db");
        if (dfile.exists())
        {
             dfile.copy("./easy.db");
             QFile::setPermissions("./easy.db",QFile::WriteOwner | QFile::ReadOwner);
        }
    }

    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("easy.db");
    db.open();
}

GeneralObject::~GeneralObject()
{

}

void GeneralObject::getUsername(QString user)
{
    QSqlQuery query;
    QString uRecived;
    QString qStr = "INSERT INTO users(user)"
                   "VALUES(:user)";
    query.prepare(qStr);
    query.bindValue(":user", user);
    query.exec();
    emit recieveUsername(uRecived);
}

void GeneralObject::userNameList()
{
    getUsers();
}

void GeneralObject::getUsers()
{
    QList <QSqlRecord> qRecList;
    QSqlQuery query;
    query.prepare("SELECT * from users");
    query.exec();
    while (query.next())
    {
        qRecList.append(query.record());
    }
    count = qRecList.count();
    emit recieveCount(count);
}
