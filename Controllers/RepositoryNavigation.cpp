#include "RepositoryNavigation.h"
#include <QtQml>

RepositoryNavigation::RepositoryNavigation(QObject *parent) : QObject(parent)
{
    LoadRepositoryList();
}

QList<QObject*> RepositoryNavigation::repositories() const
{
    return m_repositories;
}

bool RepositoryNavigation::AddRepository(QString url)
{
    url.remove("file://");
    QDir dir(url);
    if(dir.exists())
    {
        RepositoryModel* rep = new RepositoryModel();
        rep->setName(url.mid(url.lastIndexOf("/")+1));
        rep->setUrl(url);
        m_repositories.append(rep);

        emit RepositoriesChanged();
        SaveRepositoryList();

        return true;
    }
    return false;
}

void ConvertToAnyClassList(const QList<QObject*>& listQObjects, QList<RepositoryModel*>& listAnyClass)
{
    listAnyClass = QList<RepositoryModel*>();
    for( int i = 0; i < listQObjects.length(); ++i )
    {
        RepositoryModel* pAnyClass = qobject_cast<RepositoryModel*>(listQObjects.at(i));

        if(pAnyClass)
        {
            listAnyClass.append(pAnyClass);
        }
    }
}

void RepositoryNavigation::SaveRepositoryList()
{
    QList<RepositoryModel*> source;
    ConvertToAnyClassList(m_repositories, source);

    QList<QVariant> target;
    foreach (RepositoryModel* r, source) {
        QMap<QString, QVariant> v;
        v.insert("name",QVariant(r->name()));
        v.insert("url", QVariant(r->url()));
        target.append(QVariant(v));
    }

    QSettings settings;
    settings.setValue("repositories", target);
}

void RepositoryNavigation::LoadRepositoryList()
{
    QSettings settings;
    QVariant data = settings.value("repositories");
    if(data.isValid())
    {
        QList<QVariant> list = data.toList();
        foreach (QVariant v, list) {
            if(v.isValid())
            {
                QMap<QString, QVariant> map = v.toMap();
                RepositoryModel* model = new RepositoryModel();
                model->setName(map["name"].toString());
                model->setUrl(map["url"].toString());
                m_repositories.append(model);
            }
        }
    }
}
