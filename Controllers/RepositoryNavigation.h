#ifndef REPOSITORYNAVIGATION_H
#define REPOSITORYNAVIGATION_H

#include <QObject>
#include <QDir>
#include <QSettings>
#include <QVector>
#include <QQuickItem>
#include <Models/RepositoryModel.h>

class RepositoryNavigation : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QList<QObject*> repositories READ repositories NOTIFY RepositoriesChanged)
public:
    RepositoryNavigation(QObject *parent=0);
    Q_INVOKABLE bool AddRepository(QString url);
    Q_INVOKABLE void SaveRepositoryList();
    Q_INVOKABLE void LoadRepositoryList();

    QList<QObject*> repositories() const;

private:
    QList<QObject*> m_repositories;

signals:
    void RepositoriesChanged();

public slots:
};

#endif // REPOSITORYNAVIGATION_H
