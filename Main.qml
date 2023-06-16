import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls

Window {
    width: 1000
    height: 800
    visible: true
    title: qsTr("Hello World")

    RowLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            Layout.fillHeight: true

            width: 60
            color: "#3F0F3F"

            Rectangle {
                anchors {
                    right: parent.right
                    top: parent.top
                    bottom: parent.bottom
                }

                width: 1
                color: "white"
                opacity: .1
            }
        }

        ScrollViewExt {
            id: mainCol

            Layout.fillHeight: true
            Layout.preferredWidth: 260

            background: Rectangle {
                color: "#3F0F3F"
            }

            ColumnLayout {
                width: mainCol.width

                Item {
                    Layout.fillWidth: true

                    implicitHeight: 65

                    ComboBox {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 16
                    }

                    Rectangle {
                        anchors.bottom: parent.bottom

                        width: mainCol.width
                        height: 1
                        color: "white"
                        opacity: .1
                    }
                }

                MButton {
                    text: "Mentions & reactions"
                    icon.source: "qrc:///res/mention.svg"
                }

                MButton {
                    text: "Saved items"
                    icon.source: "qrc:///res/saved.svg"
                }

                MButton {
                    text: "More"
                    icon.source: "qrc:///res/more.svg"
                }

                MButton {
                    Layout.topMargin: 21

                    text: "Channels"
                    icon.source: "qrc:///res/drop.svg"
                }

                Repeater {
                    model: 7

                    ButtonExt {
                        leftPadding: 36
                        Layout.fillWidth: true

                        text: "channel-" + (index + 1)
                        icon.source: "qrc:///res/hash.svg"
                        font.weight: Font.DemiBold
                    }
                }

                AddButton {
                    text: "Add channels"
                }

                MButton {
                    Layout.topMargin: 21

                    text: "Direct Messages"
                    icon.source: "qrc:///res/drop.svg"
                }

                Repeater {
                    model: 7

                    ButtonExt {
                        leftPadding: 26
                        Layout.fillWidth: true

                        text: "channel-" + (index + 1)
                        icon.source: "qrc:///res/hash.svg"
                        font.weight: Font.DemiBold
                    }
                }

                AddButton {
                    text: "Add Teammates"
                    leftPadding: 26
                }

                Item {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }
            }
        }

        ColumnLayout {
            Layout.fillHeight: true
            Layout.fillWidth: true

            spacing: 2

            MessageView {
                Layout.fillHeight: true
                Layout.fillWidth: true

                clip: true

            }

            ChatBox {
                Layout.fillWidth: true
                Layout.leftMargin: 8
                Layout.rightMargin: 8
                Layout.bottomMargin: 24
                Layout.topMargin: 24
            }
        }
    }

    component MButton : ButtonExt {
        Layout.fillWidth: true

        leftPadding: 16
        font.weight: Font.Bold
    }

    component AddButton: ButtonExt {
        id: root

        leftPadding: 36
        Layout.fillWidth: true

        font.weight: Font.DemiBold

        iconDelegate: Rectangle {
            width: 20
            height: 20

            radius: 4

            color: Qt.rgba(1, 1, 1, .1)

            Label {
                anchors.centerIn: parent
                text: "+"
                font: root.font
                color: "white"
            }
        }
    }
}
