QT += qml quick quickcontrols2

CONFIG += c++11
RC_ICONS = icon.ico
SOURCES += main.cpp \
    class/saver.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    class/saver.h
