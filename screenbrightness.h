#ifndef SCREENBRIGHTNESS_H
#define SCREENBRIGHTNESS_H

#include <QObject>
#include <QQuickItem>

class ScreenBrightness : public QObject
{
    Q_OBJECT
public:
    explicit ScreenBrightness(QObject *parent = 0);
    int GetBrightness();
    Q_INVOKABLE void setBrightness( int desired );
signals:

public slots:

private:
    int current_brightness;

};

#endif // SCREENBRIGHTNESS_H
