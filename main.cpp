#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[]) {
  QGuiApplication app(argc, argv);
  app.setApplicationName("iphone clock");

  // QQmlApplicationEngine engine;
  // const QUrl url(QStringLiteral("qrc:/iphone_clock/Main.qml"));
  // QObject::connect(
  //     &engine, &QQmlApplicationEngine::objectCreationFailed, &app,
  //     []() { QCoreApplication::exit(-1); }, Qt::QueuedConnection);
  // engine.load(url);

  QQmlApplicationEngine engine;
  engine.loadFromModule("iphone_clock", "Main");

  return app.exec();
}
