import QtQuick 2.0
import Ubuntu.Components 1.1

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "listview.liu-xiao-guo"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    // Removes the old toolbar and enables new features of the new header.
    useDeprecatedToolbar: false

    width: units.gu(60)
    height: units.gu(85)

    Page {
        id: root
        title: i18n.tr("ListView Example")

        ListModel {
            id: mymodel

            ListElement {
                title: "Item 1"
            }
            ListElement {
                title: "Item 2"
            }
            ListElement {
                title: "Item 3"
            }
            ListElement {
                title: "Item 4"
            }
            ListElement {
                title: "Item 5"
            }
            ListElement {
                title: "Item 6"
            }
            ListElement {
                title: "Item 7"
            }
            ListElement {
                title: "Item 8"
            }
            ListElement {
                title: "Item 9"
            }
            ListElement {
                title: "Item 10"
            }
        }

        Row {
            id: view

            ListView {
                id: listview

                clip: true
                width: root.width
                height: root.height
                model:mymodel

                header: Text {
                    text: "This is the header"
                    font.pixelSize: 30

                    Rectangle {
                        anchors.top: parent.bottom
                        width: listview.width
                        height: units.gu(0.4)
                        color: "blue"
                    }
                }

                delegate: MyDelegate {}

                footer: Text {
                    text: "This is the footer"
                    font.pixelSize: 30
                }
            }

            // This is the second page
            DetailedPage {
                id: detailPage
                width: root.width
                height: root.height
            }

            Behavior on x {
                 NumberAnimation { duration: 500 }
            }
        }

        Item {
            id: popup
            visible: false
            clip: true
            property url loadUrl
            //            onLoadUrlChanged: visible = (loadUrl == '' ? false : true);
            onLoadUrlChanged: {
                //                opacity = (loadUrl == '' ? 0 : 1.0);
                opacity = 0;
                visible = (loadUrl == '' ? false : true);
                console.log("opacity: " + opacity );
                console.log("visible: " + visible );
            }
            anchors.fill: parent
            //            anchors.bottomMargin: 40
            Rectangle {
                id: bg
                anchors.fill: parent
                color: "white"
            }
            MouseArea{
                anchors.fill: parent
                enabled: popup.visible
                //Eats mouse events
            }
            Loader{
                focus: true
                source: popup.loadUrl
                //                anchors.fill: parent
                width: parent.width
                height: parent.height -toolbar.height
            }

            Rectangle {
                id: toolbar
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
                            popup.loadUrl = "";
                            ani.running = true;
                        }
                    }
                }
            }

            NumberAnimation on opacity {
                id: ani
                from: 0
                to: 1
                duration: 3000
            }
        }
    }
}

