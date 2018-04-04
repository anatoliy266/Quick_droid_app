#include "GeneralObject.h"
#include <QDebug>

GeneralObject::GeneralObject(QObject *parent) :
    QObject(parent)
{
    QFile dfile("assets:/easy.db");
    if (dfile.exists())
    {
         dfile.copy("./easy.db");
         QFile::setPermissions("./easy.db",QFile::WriteOwner | QFile::ReadOwner);
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
                   "VALUES(:user)";;
    query.prepare(qStr);
    query.bindValue(":user", user);
    if (query.exec())
    {
        uRecived = user + "inserted";
    } else {
        uRecived = user + "not inserted";
    }

    emit recieveUsername(uRecived);
}
