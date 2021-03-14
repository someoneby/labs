#include "AppEngine.h"

AppEngine::AppEngine(QObject* parent) : QObject(parent){
}

void AppEngine::receiveData(/*QString speedStr*/)
{
//    double speed = speedStr.toDouble();

//    Results results;
//    results.i = speed;

    emit sendResults(/*23*/);
}
