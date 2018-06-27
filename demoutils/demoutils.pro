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
}
else {
	TEMPLATE = lib

	macx {
		DEFINES += DARWIN
	}
	else {
		DEFINES += LINUX
                QMAKE_CXXFLAGS += -fopenmp
	}
}

CONFIG += staticlib
QT += opengl xml script

TARGET = demoutils

DEPENDPATH += include
INCLUDEPATH += include

#Input
HEADERS += include/*.h
SOURCES += libsrc/*.cc

# Trimesh2
INCLUDEPATH += ../trimesh2/include
