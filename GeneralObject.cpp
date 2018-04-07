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
    QString qStr = "INSERT INTO users(user, curVal, spent)"
                   "VALUES(:user, :cur, :spent)";
    query.prepare(qStr);
    query.bindValue(":user", user);
    query.bindValue(":cur", 0);
    query.bindValue(":spent", 0);
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
    QStringList userList;
    QSqlQuery query;
    query.prepare("SELECT * from users");
    query.exec();
    while (query.next())
    {
        qRecList.append(query.record());
        userList.append(query.record().field(1).value().toString());
    }
    count = qRecList.count();
    emit recieveCount(count);
    emit getUsersList(userList);
}


