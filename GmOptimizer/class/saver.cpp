#include "saver.h"

Saver::Saver(QObject *parent) : QObject(parent){

}

bool Saver::getSprays() const
{
    return sprays;
}

void Saver::setSprays(bool value)
{
    sprays = value;
}
