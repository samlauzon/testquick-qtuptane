#include "screenbrightness.h"


ScreenBrightness::ScreenBrightness(QObject *parent) : QObject(parent)
{

    GetBrightness();

}

//    int GetBrightness();
// void SetBrightness( int desired );

void ScreenBrightness::setBrightness( int desired )
{
    QFile file("/sys/class/backlight/rpi_backlight/brightness");
    if (!file.open(QIODevice::ReadWrite)){
        fprintf(stderr, "Cannot write brightness control\n");
        return;
    }

    char cbr[5] = {'\0'};
    snprintf(cbr, 5, "%d", desired);
    file.write(cbr, strlen(cbr));

    file.close();
}

int ScreenBrightness::GetBrightness()
{
    QFile file("/sys/class/backlight/rpi_backlight/brightness");
    if (!file.open(QIODevice::ReadOnly)){
        fprintf(stderr, "Cannot read brightness control\n");
        return -1;
    }

    QTextStream in(&file);
    //QString line = in.readLine();
    //fprintf(stderr, "Brightness: %d", line.toInt());

    file.close();
    return in.readLine().toInt();
}
