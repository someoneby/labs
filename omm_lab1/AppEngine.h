#ifndef APPENGINE_H
#define APPENGINE_H

#include <QObject>

struct Results {
    double i;
};


class AppEngine: public QObject
{
    Q_OBJECT
public:
    AppEngine(QObject *parent = nullptr);

signals:
    void sendResults(/*double speed*/);

public slots:
    void receiveData(/*QString speed*/);
};

#endif // APPENGINE_H
