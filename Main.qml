import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls

ApplicationWindow {
    width: 1000
    height: 800
    visible: true
    title: qsTr("Hello World")

    minimumWidth: 800

    header: TopBar {
    }

    RowLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            Layout.fillHeight: true

            width: 60
            color: "#3F0F3F"

            ColumnLayout {
                width: parent.width
                spacing: 10

                Rectangle {
                    Layout.fillWidth: true

                    height: 1
                    color: "white"
                    opacity: .1
                }

                Repeater {
                    model: ["A", "B", "C"]

                    AlphaButton {
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                        Layout.preferredHeight: 44
                        Layout.preferredWidth: 44

                        text: modelData
                        highlighted: text === "B"
                    }
                }

                AlphaButton {
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                    Layout.preferredHeight: 44
                    Layout.preferredWidth: 44

                    text: "+"
                    showTextBackground: false
                    font.pixelSize: 24
                    contentItem.opacity: .6
                }

            }

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

                Rectangle {
                    Layout.fillWidth: true

                    height: 1
                    color: "white"
                    opacity: .1
                }

                Item {
                    Layout.fillWidth: true

                    implicitHeight: 65

                    ComboBoxExt {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 16

                        width: 98

                        model: ["Test", "Test2", "Test3"]
                    }

                    Image {
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.margins: 16
                        source: "qrc:///res/bookmark.svg"
                        width: 36
                        height: 36
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

                DropDownButton {
                    id: channelButton

                    text: "Channels"
                }

                Repeater {
                    model: 7

                    ButtonExt {
                        leftPadding: 36
                        Layout.fillWidth: true

                        visible: channelButton.open

                        text: "channel-" + (index + 1)
                        icon.source: "qrc:///res/hash.svg"
                        font.weight: Font.DemiBold
                    }
                }

                AddButton {
                    text: "Add channels"
                    visible: channelButton.open
                }

                DropDownButton {
                    id: directMessageButton

                    text: "Direct Messages"
                }

                Repeater {
                    model: [
                        {
                            "name": "HHH",
                            "icon": "qrc:///res/d1.png",
                            "online": true,
                            "subtitle": "you"
                        },
                        {
                            "name": "Heal",
                            "icon": "qrc:///res/d2.png",
                            "online": true
                        },
                        {
                            "name": "Kamran",
                            "icon": "qrc:///res/d3.png",
                            "online": false
                        }
                    ]

                    ProfileIcon {
                        leftPadding: 26
                        Layout.fillWidth: true

                        text: modelData.name
                        icon.source: modelData.icon
                        online: modelData.online
                        subtitle: "subtitle" in modelData ? modelData.subtitle : ""
                        visible: directMessageButton.open
                    }
                }

                AddButton {
                    visible: directMessageButton.open
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

            ChannelBar {
                Layout.fillWidth: true

            }

            MessageView {
                id: messages

                topMargin: 20
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

                onInputText: function (text) {
                    messages.pushText(text)
                }
            }
        }
    }

    component MButton : ButtonExt {
        Layout.fillWidth: true

        leftPadding: 16
        font.weight: Font.Bold
    }

    component DropDownButton : MButton {
        property bool open: true

        Layout.topMargin: 21

        icon.source: "qrc:///res/drop.svg"

        onPressed: open = !open
        onIconItemChanged: {
            // binding on iconItem.roation doesn't work, since iconItem is a QtObject,
            // qml script doesn't like casting in declarative declaration
            if (!iconItem)
                return

            iconItem.rotation = Qt.binding(function () { return open ? 0 : 180 })
        }
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

    component ProfileIcon : ButtonExt {
        property bool online: false

        property string subtitle: ""

        font.weight: Font.DemiBold

        Rectangle {
            parent: iconItem
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.rightMargin: - width / 2
            anchors.bottomMargin: - height / 2

            color:  "#3F0F3F"

            width: 10
            height: 10
            radius: 5

            Rectangle {
                anchors.centerIn: parent

                width: 6
                height: 6
                radius: 3

                color: online ? "#56A97A" : "#3F0F3F"
                border.width: online ? 2 : 1
                border.color: online ? "#56A97A" : "#B4FFFFFF"
            }
        }

        Label {
            text: subtitle
            parent: contentItem
            font.weight: Font.Light
            color: "white"
        }

    }

    component AlphaButton: RoundButton {
        id: alphabutton

        property bool showTextBackground: true

        font.pixelSize: 17
        font.weight: Font.Bold

        width: 44
        height: 44

        background: Item {

            Rectangle {
                anchors.fill: parent
                radius: 12
                color: "transparent"
                border.width: 3
                border.color: "white"

                visible: alphabutton.hovered || alphabutton.highlighted

                opacity: visible ? 1 : 0
                Behavior on opacity {
                    SmoothedAnimation {
                        duration: 150
                    }
                }
            }

            Rectangle {
                anchors.fill: parent
                anchors.margins: 6

                radius: 5
                color: "#616061"
                visible:  alphabutton.showTextBackground
            }
        }

        contentItem: Label {
            text: alphabutton.text
            color: "white"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
    }
}
