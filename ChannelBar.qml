import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Container {
    width: 800
    height: 100

    topPadding: 15
    bottomPadding: 15
    leftPadding: 22
    rightPadding: 35

    background: Item {
        Rectangle {
            anchors {
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }

            height: 1
            color: "#C4C4C4"
        }
    }

    contentItem: RowLayout {
        spacing: 28

        ColumnLayout {
            Layout.alignment: Qt.AlignVCenter

            Row {
                spacing: 20

                Text {
                    text: "# channel - 6"
                    font.weight: Font.Bold
                    font.pixelSize: 15
                }

                Image {
                    anchors.verticalCenter: parent.verticalCenter
                    source: "qrc:///res/Star.svg"
                }
            }


            Row {
                spacing: 4

                Image {
                    source: "qrc:///res/pin.svg"
                }

                Text {
                    text: "13"
                    font.weight: Font.Light
                    font.pixelSize: 13
                    rightPadding: 4
                }

                Rectangle {
                    anchors.verticalCenter: parent.verticalCenter

                    height: 14
                    width: 1
                    color: "#cccccc"
                }

                Text {
                    text: "📱 Channel for number 6"
                    font.weight: Font.Light
                    font.pixelSize: 13
                }
            }
        }

        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true

        }

        Row {
            id: channelRow

            spacing: -8

            Repeater {
                model: ["qrc:///res/channel3.png", "qrc:///res/channel2.png", "qrc:///res/channel1.png"]

                Image {
                    z: channelRow.count - index
                    source: modelData
                }
            }
        }


        Text {
            Layout.margins: -18

            text: "493"
            font.weight: Font.DemiBold
        }

        Image {
            source: "qrc:///res/add.svg"
        }

        Image {
            source: "qrc:///res/info.svg"
        }
    }
}
