#include "screenbrightness.h"


#include <QGuiApplication>
#include <QQmlApplicationEngine>


#include <QtQml>

#include <QImage>



extern "C" {
#include "libuptane.h"
}




void data_received(int type, int size, char *filename)
{
    if (type == 1)
    {
        fprintf(stderr, "\n Got some metadata, %s, %d! \n", filename, size);
    }
    if( type == 2)
    {
        fprintf(stderr, "\n Got a new image, %s, %d! \n", filename, size);


        QFile f(filename);
        while( f.size() != size ) {}
        QFile done(filename);
        fprintf(stderr, "%d \n", done.size());


    }

}

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    uptane_init();

    qmlRegisterType<ScreenBrightness>("screenBrightness", 1, 0, "ScreenBrightness");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));


    //fprintf(stderr,"Testing, 1, 2, 3?");
    set_callback((void *)&data_received);

    return app.exec();
}
