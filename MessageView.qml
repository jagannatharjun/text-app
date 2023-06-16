import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ListView {
    id: root

    verticalLayoutDirection: ListView.BottomToTop
    spacing: 16

    model: [
        {
            "user": "Heal",
            "icon": "qrc:///res/m2.png",
            "date": "Today",
            "time": "6:49 PM",
            "text": "그 안에서 나는 작은 하나의 이야기가 되어 흘러간다.",
            "reactions": [["👍", 1]]
        },
        {
            "user": "Kamran",
            "icon": "qrc:///res/m1.png",
            "date": "Monday, March 1st",
            "time": "6:49 PM",
            "total_replies": "8 replies",
            "last_reply": "Last reply today at 3:12",
            "replies": ["qrc:///res/r2.png", "qrc:///res/r3.png" , "qrc:///res/r4.png", "qrc:///res/r5.png", "qrc:///res/r6.png"],
            "text": "봄날의 햇살 따라 새벽길을 걷네, 작은 꽃들이 눈부신 향기를 품고 서로 맞닿아 웃네. 나비들은 춤추며 색다른 세계를 만들어가고, 그 속에서 나는 풍경에 녹아들어 자유롭게 흘러가네.

어린 그림자들이 덧없이 노래하며 흐르고, 푸른 하늘은 감탄을 자아내며 펼쳐진다. 저 멀리 산들은 우리에게 약속을 전하고, 물결처럼 흐르는 강물은 시간을 담고 흘러간다.
끝없이 이어지는 세상의 수레바퀴, 그 안에서 나는 작은 하나의 이야기가 되어 흘러간다."
        },
        {
            "user": "Kamran",
            "icon": "qrc:///res/m1.png",
            "date": "Monday, March 1st",
            "time": "6:49 PM",
            "total_replies": "3 replies",
            "last_reply": "Last reply today at 3:12",
            "replies": ["qrc:///res/r2.png", "qrc:///res/r3.png" , "qrc:///res/r4.png"],
            "text": "봄날의 햇살 따라 새벽길을 걷네, 작은 꽃들이 눈부신 향기를 품고 서로 맞닿아 웃네. 나비들은 춤추며 색다른 세계를 만들어가고, 그 속에서 나는 풍경에 녹아들어 자유롭게 흘러가네.

어린 그림자들이 덧없이 노래하며 흐르고, 푸른 하늘은 감탄을 자아내며 펼쳐진다. 저 멀리 산들은 우리에게 약속을 전하고, 물결처럼 흐르는 강물은 시간을 담고 흘러간다.
끝없이 이어지는 세상의 수레바퀴, 그 안에서 나는 작은 하나의 이야기가 되어 흘러간다."
        }
    ]

    delegate: ColumnLayout {
        width: root.width

        // upper line
        DateHeader {
            date: modelData.date
            highlight: date === "Today"
        }

        RowLayout {
            Layout.margins: 10
            Layout.fillHeight: true
            Layout.fillWidth: true

            Image {
                width: 36
                height: 36
                source: modelData.icon

                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            }

            ColumnLayout {
                Layout.fillHeight: true
                Layout.fillWidth: true

                Row {
                    spacing: 7

                    Label {
                        font.weight: Font.ExtraBold
                        text: modelData.user
                        color: "#1D1C1D"
                    }

                    Label {
                        anchors.verticalCenter: parent.verticalCenter

                        font.weight: Font.Light
                        font.pixelSize: 13
                        text: modelData.time
                    }
                }

                Label {
                    Layout.fillWidth: true
                    Layout.preferredWidth: root.width
                    Layout.bottomMargin: 8

                    text: modelData.text

                    wrapMode: Text.WordWrap
                }

                Loader {
                    active: "total_replies" in modelData
                            && modelData.total_replies.length > 0

                    sourceComponent: Reply {
                        replies: modelData.replies
                        total_replies: modelData.total_replies
                        last_reply: modelData.last_reply
                    }
                }

                Loader {
                    active: "reactions" in modelData
                            && modelData.reactions.length > 0

                    sourceComponent: Row {
                        spacing: 6

                        Repeater {
                            model: modelData.reactions

                            delegate: Reaction {
                                emoji: modelData[0]
                                reacts: modelData[1]
                            }
                        }

                        Rectangle {
                            color: "#EFEFEF"

                            width: 36
                            height: 24
                            radius: 35

                            Image {
                                anchors.centerIn: parent
                                source: "qrc:///res/react.svg"
                            }
                        }
                    }
                }
            }
        }
    }

    component DateHeader: RowLayout {
        property alias date: dateTxt.text
        property bool highlight: false

        property color _line: highlight ? "#CE375C" : "#DFDFDF"

        spacing: 0

        Rectangle {
            Layout.fillWidth: true
            color: _line
            height: 1
        }

        Pane {

            leftPadding: 10
            rightPadding: 10
            topPadding: 6
            bottomPadding: 6

            background: Rectangle {
                radius: width / 2
                border.color: "#DFDFDF"
                border.width: 1
            }

            contentItem: Row {
                spacing: 5

                Label {
                    id: dateTxt

                    font.pixelSize: 13
                    font.weight: Font.Bold
                }

                Image {
                    anchors.verticalCenter: dateTxt.verticalCenter
                    source: "qrc:///res/down.svg"
                }
            }
        }


        Rectangle {
            Layout.fillWidth: true
            color: _line
            height: 1
        }

        Label {
            Layout.fillHeight: true

            leftPadding: 8
            rightPadding: 8

            color: _line
            text: "New"
            visible: highlight
            font.pixelSize: 13
            verticalAlignment: Text.AlignVCenter
        }
    }

    component Reply: Row {
        spacing: 4

        property alias replies: replyRepeater.model
        property alias total_replies: totalTxt.text
        property alias last_reply: lastReplyTxt.text

        Repeater {
            id: replyRepeater

            delegate: Image {
                source: modelData
            }
        }

        Label {
            id: totalTxt

            anchors.verticalCenter: parent.verticalCenter
            padding: 4
            color: "#3C71A6"
            font.pixelSize: 13
            font.weight: Font.Bold
        }

        Label {
            id: lastReplyTxt

            anchors.verticalCenter: parent.verticalCenter
            padding: 4
            font.pixelSize: 13
            color: "#6F6F6F"
        }
    }

    component Reaction: Rectangle {
        property alias emoji: emojiTxt.text
        property alias reacts: countTxt.text

        width: 40
        height: 26
        radius: 35

        color: "#EFEFEF"

        Row {
            anchors.centerIn: parent

            Text {
                id: emojiTxt
            }

            Text {
                id: countTxt

                anchors.verticalCenter: emojiTxt.verticalCenter
                font.pixelSize: 11
            }
        }
    }
}
