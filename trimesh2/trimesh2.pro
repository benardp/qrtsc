CONFIG += debug_and_release

CONFIG(release, debug|release) {
    DBGNAME = release
}
else {
    DBGNAME = debug
}
DESTDIR = $${DBGNAME}

win32 {
    TEMPLATE = vclib
    DEFINES += _CRT_SECURE_NO_WARNINGS
}
else {
    TEMPLATE = lib

    macx {
        DEFINES += DARWIN
        }
    else {
        QMAKE_CXXFLAGS += -fopenmp
        DEFINES += LINUX
    }
}

CONFIG += staticlib
QT += opengl xml

TARGET = trimesh

DEPENDPATH += include
INCLUDEPATH += include

#Input
HEADERS += include/*.h
SOURCES += libsrc/*.cc
