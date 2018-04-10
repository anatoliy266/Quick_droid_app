/*#ifndef CHECKSCAN_H
#define CHECKSCAN_H

#include <QObject>
#include <QImage>
#include <QtQml/QQmlEngine>
#include <QtQml/QQmlContext>
#include <QtQuick/QQuickImageProvider>
#include <QtQml/QQmlImageProviderBase>
#include <QGuiApplication>
#include <QPixmap>

class ChekScan : public QObject
{
    Q_OBJECT
public:
    explicit ChekScan(QObject *parent = nullptr);
    ~ChekScan();
    void catChek(QImage img);
signals:
    void returnImg(QImage image);
public slots:
    void getChek(QString &path);

private:
};

#endif // CHECKSCAN_H
*/
