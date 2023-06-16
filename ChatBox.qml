import QtQuick
import QtQuick.Controls
import QtQuick.Layouts


Container {

    clip: true

    implicitHeight: implicitContentHeight + topPadding + bottomPadding

    leftPadding: 10
    rightPadding: 10
    topPadding: 10
    bottomPadding: 4

    signal inputText(string text)

    background: Rectangle {
        color: "transparent"
        radius: 4
        border.color: "#939393"
        border.width: 1
    }

    contentItem: ColumnLayout {
        TextArea {
            Layout.fillWidth: true

            placeholderText: "Message # uxui_design"

            Keys.priority: Keys.BeforeItem
            Keys.onReturnPressed: function (event) {
                event.accepted = !(event.modifiers & Qt.ShiftModifier)
                if (event.accepted)
                    inputText(text)
            }
        }

        ScrollViewExt {
            id: editBox

            Layout.fillWidth: true

            implicitWidth: layout.width
            implicitHeight: layout.height

            RowLayout {
                id: layout

                spacing: 10
                width: editBox.width

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
}
