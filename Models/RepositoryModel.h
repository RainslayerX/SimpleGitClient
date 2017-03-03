#ifndef REPOSITORYMODEL_H
#define REPOSITORYMODEL_H

#include <QObject>

class RepositoryModel : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString name READ name WRITE setName)
    Q_PROPERTY(QString url READ url WRITE setUrl)

public:
    RepositoryModel();

    QString name() const;
    void setName(const QString &name);

    QString url() const;
    void setUrl(const QString &url);

private:
    QString m_name;
    QString m_url;
};

#endif // REPOSITORYMODEL_H

