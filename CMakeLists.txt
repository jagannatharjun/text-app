cmake_minimum_required(VERSION 3.16)

project(textapp VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 REQUIRED COMPONENTS Quick QuickControls2)


qt_add_executable(apptextapp
    main.cpp
)

qt_add_qml_module(apptextapp
    URI text-app
    VERSION 1.0
    QML_FILES
        Main.qml
	ButtonExt.qml
	ScrollViewExt.qml
	MessageView.qml
	ChatBox.qml
	ComboBoxExt.qml
)

FILE(GLOB_RECURSE
    RESOURCES
    LIST_DIRECTORIES FALSE
    RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
    res/*
)

message(${RESOURCES})

qt_add_resources(apptextapp "res"
    PREFIX "/"
    FILES
        ${RESOURCES}
)

set_target_properties(apptextapp PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(apptextapp
    PRIVATE Qt6::Quick Qt6::QuickControls2
)

install(TARGETS apptextapp
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
