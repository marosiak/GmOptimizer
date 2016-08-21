#ifndef SAVER_H
#define SAVER_H

#include <QObject>
#include <QDebug>
#include <QUrl>
#include <QSettings>
#include <QFile>

class Saver : public QObject
{
    Q_OBJECT
public:
    explicit Saver(QObject *parent = 0);
    bool sprays = true;
    bool sky3d = true;
    bool shadows = true;
    bool facials = true;
    bool ragdolls = true;
    bool gibs = true;
    bool preload = true;
    bool rope = true;
    Q_INVOKABLE QString getPath();
    Q_INVOKABLE void setVar(QString value, bool value2);
    Q_INVOKABLE QString returnCode();
    Q_INVOKABLE void save();


signals:

public slots:
};

#endif // SAVER_H
