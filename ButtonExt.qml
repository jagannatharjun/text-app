import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Templates as T

T.Button {
    id: root

    property alias iconItem: iconLoader.item
    property Component iconDelegate: DefaultIconDelegate {
    }

    font.pixelSize: 14

    padding: 4

    icon.width: 20
    icon.height: 20

    implicitWidth:  implicitContentWidth+ leftPadding + rightPadding
    implicitHeight: implicitContentHeight + topPadding + bottomPadding

    background: Rectangle {
        color: hovered ? "#2D649E" : "transparent"
    }

    contentItem: Row {
        spacing: 10

        Loader {
            id: iconLoader

            sourceComponent: root.iconDelegate
        }

        Label {
            font: root.font
            text: root.text
            visible: !!text
            color: "white"
            opacity: .6
            verticalAlignment: Text.AlignVCenter
        }
    }

    component DefaultIconDelegate: Image {
        width: icon.width
        height: icon.height

        source: icon.source

        fillMode: Image.Pad
        verticalAlignment: Image.AlignVCenter
        horizontalAlignment: Image.AlignHCenter
    }
}
