#ifndef SAVER_H
#define SAVER_H

#include <QObject>

class Saver : public QObject
{
    Q_OBJECT
public:
    explicit Saver(QObject *parent = 0);


    bool sprays;
    bool getSprays() const;
    Q_INVOKABLE void setSprays(bool value);



signals:

public slots:
};

#endif // SAVER_H
