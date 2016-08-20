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
    Material.accent: Material.Grey
    Material.theme: Material.Dark

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
            ListModel {
                id: settingsModel
                ListElement {
                    name: "Sprays"
                    cmd: "cl_playerspraydisable \"1\"\n"
                }
                ListElement {
                    name: "3D Sky"
                    cmd: "r_3dsky \"0\"\n"
                }
                ListElement {
                    name: "Shadows"
                    cmd: "mat_shadowstate \"0\"\nr_shadowmaxrendered \"0\"\nr_shadowrendertotexture \"0\"\nr_shadows \"0\"\n"
                }
                ListElement {
                    name: "Facial features"
                    cmd: "r_eyes \"0\"\nr_flex \"0\"\nr_lod \"2\"\nr_rootlod \"2\"\nr_teeth \"0\"\n"
                }
                ListElement {
                    name: "Ragdolls"
                    cmd: "cl_ragdoll_fade_time \"0\"\ncl_ragdoll_forcefade 1\ncl_ragdoll_physics_enable \"0\"\ng_ragdoll_fadespeed \"0\"\ng_ragdoll_lvfadespeed \"0\"\nragdoll_sleepaftertime \"0\"\n"
                }
                ListElement {
                    name: "Gibs"
                    cmd: "cl_phys_props_enable \"0\"\ncl_phys_props_max \"0\"\nprops_break_max_pieces \"0\"\nr_propsmaxdist \"1\"\nviolence_agibs \"0\"\nviolence_hgibs \"0\"\n"
                }
                ListElement {
                    name: "Force preload"
                    cmd: "cl_forcepreload \"1\"\n"
                }
            }

            ListView {
                anchors.fill: parent
                model: settingsModel
                delegate: Switch {
                    text: name
                    checked: true
                    onCheckedChanged: {
                        state = checked;
                        switch(name){
                        case "Sprays":
                            console.log("Sprays clicked");
                            Saver.setSprays(checked);
                            break
                        }
                    }
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
