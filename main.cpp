#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>

#include <QDir>
#include <QFontDatabase>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQuickStyle::setStyle("Basic");

    for (const auto file : QDir(":/res/fonts").entryInfoList({"*"}))
    {
       QFontDatabase::addApplicationFont(file.absoluteFilePath());
    }

    QFont defaultFont("Lato");
    defaultFont.setPixelSize(15);
    app.setFont(defaultFont);

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/text-app/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
