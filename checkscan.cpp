/*#include "checkscan.h"

ChekScan::ChekScan(QObject *parent) : QObject(parent)
{

}

ChekScan::~ChekScan()
{

}

void ChekScan::getChek(QString& path)
{
    QUrl imageUrl(path);
    QQmlEngine* engine = QQmlEngine::contextForObject(this)->engine();
    QQmlImageProviderBase* imageProviderBase = engine->imageProvider(imageUrl.host());
    QQuickImageProvider* imageProvider = static_cast<QQuickImageProvider>(imageProviderBase);
    QSize imageSize;
    QString imageId = imageUrl.path().remove(0,1);
    QImage image = imageProvider->requestImage(imageId, &imageSize, imageSize);
    if( !image.isNull()) {
        catChek(image);
    }
}

void ChekScan::catChek(QImage img)
{
    QImage image = img;
    QRgba64 rgbPix;
    for (int i = 0; i<image.width(); i++)
    {
        for (int j=0; j<image.height(); i++)
        {
            rgbPix = image.pixel(i,j);
            if (rgbPix.red()<100 || rgbPix.green()<100 || rgbPix.blue()<100)
            {
                image.setPixel(i,j, qRgb(0,0,0));
            } else {
                image.setPixel(i,j, qRgb(255, 255, 255));
            }
        }
    }
}
*/
