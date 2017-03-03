#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <git2.h>

#include <Controllers/ApplicationController.h>
#include <Controllers/RepositoryNavigation.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QCoreApplication::setOrganizationName("RainX");
    QCoreApplication::setOrganizationDomain("rainx.com");
    QCoreApplication::setApplicationName("SimpleGitClient");

    qmlRegisterType<ApplicationController>("Controllers", 1, 0, "ApplicationController");
    qmlRegisterType<RepositoryNavigation>("Controllers", 1, 0, "RepositoryNavigation");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    git_libgit2_init();

    const char * REPO_PATH = "/path/to/your/repo/";
    git_repository * repo = nullptr;
    git_repository_open(&repo, REPO_PATH);


    return app.exec();
}
