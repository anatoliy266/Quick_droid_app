#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "GeneralObject.h"
#include "generalmodel.h"

int main(int argc, char *argv[])
{

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    GeneralObject GoB;
    GeneralModel GmoD;
    QQmlApplicationEngine engine;
    QQmlContext *context = engine.rootContext();
    context->setContextProperty("GoB", &GoB);
    context->setContextProperty("GmoD", &GmoD);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
