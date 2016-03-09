import QtQuick 2.0

Item {
    property Item item

    width: listview.width
    height: units.gu(8)
    Text {
        id: text
        text: title
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: units.gu(10)
        font.pixelSize: 30

    }

    Rectangle {
        anchors.top: text.bottom
        width: parent.width
        height: units.gu(0.2)
        color: "gray"
    }

    Image {
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        source: "images/arrow.png"
        rotation: -90
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
//            popup.loadUrl = "ExampleQml.qml"
            view.x = -root.width;
        }
    }
}
