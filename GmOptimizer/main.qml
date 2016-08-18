import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    visible: true
    width: 640
    minimumWidth: 430; maximumWidth: 635
    minimumHeight: 210
    height: 480
    title: qsTr("Garry's Mod Optimizer")
    Material.accent: Material.BlueGrey
    Material.theme: Material.Light

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Pane {
            id: codePage
            Flickable {
                width: parent.width-50
                height: parent.height-25
                contentHeight: textedit.height
                TextEdit {
                    id: textedit
                    width: parent.width-29
                    anchors.centerIn: parent
                    text: "d\nx\nd\nx\nd\nx\nd\nx\nd\nx\nd\nx\nd\nx\nd\nx\nd\nx\nd\nx\nd\nx\nd\nx\nd\nx\nd\nx\nd\nx\nd\nx\nd\nx\nd\nx\nd\nx\nd\nx\nd\nx\nd\nx\nd\nx\nd\nx\nd\nx\nd\nx\nd\nx\nd\nx\n"
                }
            }
            Button {
                anchors.bottom: parent.bottom; anchors.right: parent.right;
                anchors.bottomMargin: 6
                anchors.rightMargin: 6
                text: "save"
            }

        }
        Pane {
            id: settingsPage
            ListView {
                anchors.centerIn: parent
                //height: 200
                anchors.fill: parent
                model: ["Rope", "3D Sky", "Sprays", "Shadows"]
                delegate: Switch {
                    text: modelData
                }
            }

        }
    }

    header: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        width: 400
        TabButton {
            text: qsTr("Code")
        }
        TabButton {
            text: qsTr("Settings")
        }
    }
}
