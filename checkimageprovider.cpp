#include "checkimageprovider.h"

CheckImageProvider::CheckImageProvider() : QQuickImageProvider(QQuickImageProvider::Image)
{
    chekscan = new ChekScan();
}

CheckImageProvider::~CheckImageProvider()
{

}

QImage CheckImageProvider::getchek(QString path)
{
    path = chekpath.path();
    Cimage = chekscan->getChek(path);
    return Cimage;
}

QImage CheckImageProvider::requestImage(const QString &id, QSize *size, const QSize &requestedSize)
{
    if (!Cimage.isNull())
    {

        int width = Cimage.width();
        int height = Cimage.height();
        if (size)
        {
            *size = QSize(width, height);
            return Cimage;
        }
    }

}
