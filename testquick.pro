TEMPLATE = app

QT += qml quick
CONFIG += c++11

SOURCES += main.cpp \
    screenbrightness.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    screenbrightness.h

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/libuptane/release/ -luptane
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/libuptane/debug/ -luptane
else:unix: LIBS += -L$$PWD/libuptane/ -luptane

INCLUDEPATH += $$PWD/libuptane/include
DEPENDPATH += $$PWD/libuptane/include
