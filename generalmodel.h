#ifndef GENERALMODEL_H
#define GENERALMODEL_H

#include <QObject>
#include <QSqlQueryModel>
#include <QByteArray>
#include <QVariant>

class GeneralModel : public QSqlQueryModel
{
    Q_OBJECT
public:
    enum Roles {
        idRole = Qt::UserRole+1,
        nameRole,
        freeRole,
        outRole
    };
    explicit GeneralModel(QObject *parent = nullptr);
    ~GeneralModel();
    QVariant data(const QModelIndex &idx, int role) const;
protected:
    QHash<int, QByteArray> roleNames() const;
signals:

public slots:
    void updateModel();
};

#endif // GENERALMODEL_H
