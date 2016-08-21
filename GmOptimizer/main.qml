import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.0

ApplicationWindow {
    visible: true
    width: 640
    minimumWidth: 430; maximumWidth: 635
    minimumHeight: 210
    height: 480
    title: qsTr("Garry's Mod Optimizer")
    Material.accent: Material.Grey
    Material.theme: Material.Dark
    FontLoader {
        id: robotoM
        source: "./fonts/Roboto-Medium.ttf"
    }

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
                    color: "#dbdbdb"
                    font.family: robotoM.name
                    font.pointSize: 10
                    anchors.centerIn: parent
                    Timer {
                        interval: 2; running: true; repeat: true
                        onTriggered: {
                            if(Saver.returnCode() === ""){
                                textedit.text = "Nothing here"
                                saverbutton.enabled = false
                            }else {
                                textedit.text = Saver.returnCode()
                                saverbutton.enabled = true
                            }
                        }
                    }
                }
            }
        }
        Pane {
            id: settingsPage
            ListModel {
                id: settingsModel
                ListElement {
                    name: "Sprays"
                }
                ListElement {
                    name: "3D Sky"
                }
                ListElement {
                    name: "Shadows"
                }
                ListElement {
                    name: "Facial features"
                }
                ListElement {
                    name: "Ragdolls"
                }
                ListElement {
                    name: "Gibs"
                }
                ListElement {
                    name: "Rope"
                    cmd: "r_drawropes 0\n"
                }
                ListElement {
                    name: "Force preload"
                }
            }

            ListView {
                anchors.fill: parent
                model: settingsModel
                delegate: Switch {
                    text: name
                    checked: true
                    onCheckedChanged: {
                        Saver.setVar(name, checked)
                        Saver.returnCode();
                    }
                }
            }

        }
    }
    Button {
        id:saverbutton
        anchors.bottom: parent.bottom; anchors.right: parent.right;
        anchors.bottomMargin: 6
        anchors.rightMargin: 10
        text: "save"
        ToolTip.visible: pressed
        ToolTip.timeout: 2000
        ToolTip.text: qsTr("Done")
        onClicked: Saver.save();
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
