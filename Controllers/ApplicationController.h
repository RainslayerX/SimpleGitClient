#ifndef APPLICATIONCONTROLLER_H
#define APPLICATIONCONTROLLER_H

#include <QObject>

class ApplicationController : public QObject
{
    Q_OBJECT
public:
    explicit ApplicationController(QObject *parent = 0);
    Q_INVOKABLE void SwitchPage(QString targetPage);
     
signals:

public slots:
};

#endif // APPLICATIONCONTROLLER_H
