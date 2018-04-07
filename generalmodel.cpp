#include "generalmodel.h"

GeneralModel::GeneralModel(QObject *parent) : QSqlQueryModel(parent)
{
    this->updateModel();
}

GeneralModel::~GeneralModel()
{

}

QVariant GeneralModel::data(const QModelIndex &idx, int role) const
{
    int columnID = role-Qt::UserRole-1;
    QModelIndex modelIndex = this->index(idx.row(), columnID);
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

QHash<int, QByteArray> GeneralModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[idRole] = "id";
    roles[nameRole] = "name";
    roles[freeRole] = "cur";
    roles[outRole] = "off";
    return roles;
}
void GeneralModel::updateModel()
{
    this->setQuery("SELECT * FROM users");
}
