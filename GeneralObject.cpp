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
    } else {
        QString new_name = QStandardPaths::locate(QStandardPaths::DownloadLocation, "easy.db", QStandardPaths::LocateFile);
        QFile newDBfile(new_name);

        if (newDBfile.exists())
        {
            dbfile.remove();
            newDBfile.rename(new_name, "./easy.db");
            QFile::setPermissions("./easy.db",QFile::WriteOwner | QFile::ReadOwner);
            /*if (coppy)
            {
                QString new_name1 = QStandardPaths::locate(QStandardPaths::DownloadLocation, "easy.db", QStandardPaths::LocateFile);
                QFile newDBfile1(new_name1);
                QFile::setPermissions(newDBfile1.fileName(),QFile::WriteOwner);
                newDBfile1.rename("easy.db", "easy.txt");
            }*/
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

void GeneralObject::delUser(int id)
{
    QSqlQuery query;
    query.prepare("DELETE FROM users WHERE _id in (:id)");
    query.bindValue(":id", id);
    query.exec();
}
