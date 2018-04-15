#include "chekpath.h"

chekPath::chekPath(QObject *parent) : QObject(parent)
{

}

chekPath::~chekPath()
{

}

void chekPath::getPath(QString path)
{
    ImPath = path;
}

QString chekPath::path()
{
    if (ImPath != "")
        return ImPath;
}
