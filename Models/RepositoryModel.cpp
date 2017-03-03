#include "RepositoryModel.h"

RepositoryModel::RepositoryModel() { }

QString RepositoryModel::name() const
{
    return m_name;
}

void RepositoryModel::setName(const QString &name)
{
    if (name != m_name) {
        m_name = name;
    }
}

QString RepositoryModel::url() const
{
    return m_url;
}

void RepositoryModel::setUrl(const QString &url)
{
    if (url != m_url) {
        m_url = url;
    }
}
