import QtQuick
import QtQuick.Controls
import QtQuick.Layouts


Container {

    implicitHeight: Math.max(88, implicitContentHeight + topInset + bottomInset)

    padding: 10

    background: Rectangle {
        color: "transparent"
        radius: 4
        border.color: "#939393"
        border.width: 1
    }

    contentItem: ColumnLayout {

        TextArea {
            Layout.fillHeight: true
            Layout.fillWidth: true

            placeholderText: "Message # uxui_design"
        }

        RowLayout {
            spacing: 10

            ButtonExt {
                icon.source: "qrc:///res/light.svg"
            }

            Rectangle {
                Layout.alignment: Qt.AlignVCenter

                height: 24
                width: 1

                color: "#DFDFDF"
            }

            Image {
                source: "qrc:///res/editbuttons.png"
            }

            Item {
                Layout.fillHeight: true
                Layout.fillWidth: true
            }

            ButtonExt {
                icon.source: "qrc:///res/Aa.png"
            }

            ButtonExt {
                icon.source: "qrc:///res/at.png"
            }

            ButtonExt {
                icon.source: "qrc:///res/emoji.png"
            }

            ButtonExt {
                icon.source: "qrc:///res/clip.png"
            }

            ButtonExt {
                icon.source: "qrc:///res/send.png"
            }

        }
    }
}
