import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Templates as T

T.Button {
    id: root

    property Component iconDelegate: DefaultIconDelegate {
    }

    font.pixelSize: 14

    padding: 4

    implicitWidth:  implicitContentWidth+ leftPadding + rightPadding
    implicitHeight: implicitContentHeight + topPadding + bottomPadding

    background: Rectangle {
        color: hovered ? "#2D649E" : "transparent"
    }

    contentItem: RowLayout {
        spacing: 10

        Loader {
            sourceComponent: root.iconDelegate
        }

        Label {
            Layout.fillHeight: true
            Layout.fillWidth: true

            font: root.font
            text: root.text
            visible: !!text
            color: "white"
            opacity: .6
            verticalAlignment: Text.AlignVCenter
        }
    }

    component DefaultIconDelegate: Item {
        width: 20
        height: 20

        Image {
            anchors.centerIn: parent

            source: icon.source
            fillMode: Image.PreserveAspectFit
        }
    }
}
