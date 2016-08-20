#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QQmlContext>
#include <class/saver.h>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    QQuickStyle::setStyle("Material");
    QQmlApplicationEngine engine;
    Saver saver;
    engine.rootContext()->setContextProperty("Saver", &saver);
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}
