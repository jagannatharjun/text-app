import QtQuick
import QtQuick.Controls

ComboBox {
    id: control

    implicitWidth:  implicitContentWidth+ leftPadding + rightPadding
    implicitHeight: implicitContentHeight + topPadding + bottomPadding

    background: null

    font.weight: Font.DemiBold
    font.pixelSize: 15

    contentItem: Text {
        leftPadding: 0
        rightPadding: control.indicator.width + control.spacing

        text: control.displayText
        font: control.font
        color: "white"
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    indicator: Image {
        x: control.width - width - control.rightPadding
        y: control.topPadding + (control.availableHeight - height) / 2

        source: "qrc:///res/dropdown.png"
    }
}
