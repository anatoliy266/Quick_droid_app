#ifndef CHEKSCAN_H
#define CHEKSCAN_H

#include <QObject>
#include <QImage>
#include <QtQml/QQmlEngine>
#include <QtQml/QQmlContext>
#include <QtQuick/QQuickImageProvider>
#include <QtQml/QQmlImageProviderBase>
#include <QApplication>
#include <QPixmap>
#include <iostream>

class ChekScan : public QObject
{
    Q_OBJECT
public:
    explicit ChekScan(QObject *parent = nullptr);
    ~ChekScan();
    QImage getChek(QString path);
    void catChek(QImage img);
private:
};

#endif // CHEKSCAN_H

