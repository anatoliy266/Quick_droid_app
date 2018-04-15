#ifndef CHECKIMAGEPROVIDER_H
#define CHECKIMAGEPROVIDER_H

#include <QObject>
#include <QQuickImageProvider>
#include "checkscan.h"
#include "chekpath.h"

class CheckImageProvider : public QQuickImageProvider
{
public:
    CheckImageProvider();
    ~CheckImageProvider();
    QImage requestImage(const QString &id, QSize *size, const QSize &requestedSize);
    QImage getchek(QString path);
private:
    QImage Cimage;
    ChekScan* chekscan;
    chekPath chekpath;
    QString Path;

};

#endif // CHECKIMAGEPROVIDER_H
