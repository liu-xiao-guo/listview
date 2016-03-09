import QtQuick 2.0
import Ubuntu.Components 1.1

Item  {
    Image {
        id: image
        width: parent.width
        height: parent.height - mytoolbar.height
        source: "images/girl.jpg"
    }

    Rectangle {
        id: mytoolbar
        width: parent.width
        height: units.gu(4)
        anchors.bottom: parent.bottom
        color: "blue"

        Icon {
            name: "previous"
            width: units.gu(3.5)
            height: units.gu(3.5)

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    view.x = 0;
                }
            }
        }
    }
}
