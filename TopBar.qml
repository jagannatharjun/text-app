import QtQuick
import QtQuick.Controls
import QtQuick.Layouts


Pane {
    background: Rectangle {
        color: "#301134"
    }

    padding: 6

    contentItem: RowLayout {
        id: layout

        spacing: 10

        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        Repeater {
            model: ["qrc:///res/right.png", "qrc:///res/left.png", "qrc:///res/clock.png"]

            ButtonExt {
                icon.source: modelData
            }
        }

        TextArea {
            id: search

            Layout.preferredWidth: 500
            Layout.minimumWidth: 100
            Layout.maximumWidth: 500

            color: palette.light

            background: Rectangle {
                color: "#3E2142"
                radius: 5
                border.width: 1
                border.color: Qt.rgba(1, 1, 1, .2)
            }

            Row {
                anchors.centerIn: parent
                z: 1
                spacing: 12
                visible: !search.activeFocus && !search.text

                Image {
                    anchors.verticalCenter: parent.verticalCenter
                    source: "qrc:///res/search.svg"
                }

                Label {
                    text: "Search DesignersKR"
                    color: "white"
                    opacity: .8
                    font.pixelSize: 13
                }
            }

        }

        ButtonExt {
            Layout.alignment: Qt.AlignCenter

            icon.source: "qrc:///res/question.png"
        }

        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        Image {
            Layout.fillHeight: true
            source: "qrc:///res/profile.png"
        }
    }
}
