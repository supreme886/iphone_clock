import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

// Rectangle {
//     id:page_0
//     anchors.fill: parent
//     color: "black"

//     Label {
//         anchors.centerIn: parent
//         text: "Page 1"
//         font.pixelSize: 20
//     }

    // RowLayout {
    //     ColumnLayout {
    //         Button {
    //             id:edit_btn
    //             text: "编辑"
    //         }

    //         Button {
    //             id: add_btn
    //         }
    //     }
    // }
// }

Rectangle {
    id:wrold_clock
    // color: "black"

    ColumnLayout {
        anchors.fill: parent
        RowLayout {
            Layout.alignment: Qt.AlignTop
            Button {
                id:edit_btn
                text: "编辑"
                Layout.alignment: Qt.AlignLeft
            }

            // 使用 Item 占据中间空白
             Item {
                 Layout.fillWidth: true
             }

            Button {
                id: add_btn
                text: "添加"
                Layout.alignment: Qt.AlignRight
            }
        }

        ListView {
            id: listView
            clip: true
            section.property: "type"
            section.delegate: Pane {
                id: sectionPane
                required property string section
                width: ListView.view.width
                height: sectionLabel.implicitHeight + 20
                Label {
                    id: sectionLabel
                    text: sectionPane.section
                    anchors.centerIn: parent
                }
            }

            Layout.fillWidth: true
            Layout.fillHeight: true

            model: ListModel {
                ListElement { type: "ItemDelegate"; value: qsTr("ItemDelegate1") }
                ListElement { type: "ItemDelegate"; value: qsTr("ItemDelegate2") }
                ListElement { type: "ItemDelegate"; value: qsTr("ItemDelegate3") }
                ListElement { type: "SwipeDelegate"; value: qsTr("SwipeDelegate1") }
                ListElement { type: "SwipeDelegate"; value: qsTr("SwipeDelegate2") }
                ListElement { type: "SwipeDelegate"; value: qsTr("SwipeDelegate3") }
                ListElement { type: "CheckDelegate"; value: qsTr("CheckDelegate1") }
                ListElement { type: "CheckDelegate"; value: qsTr("CheckDelegate2") }
                ListElement { type: "CheckDelegate"; value: qsTr("CheckDelegate3") }
                ListElement { type: "RadioDelegate"; value: qsTr("RadioDelegate1") }
                ListElement { type: "RadioDelegate"; value: qsTr("RadioDelegate2") }
                ListElement { type: "RadioDelegate"; value: qsTr("RadioDelegate3") }
                ListElement { type: "SwitchDelegate"; value: qsTr("SwitchDelegate1") }
                ListElement { type: "SwitchDelegate"; value: qsTr("SwitchDelegate2") }
                ListElement { type: "SwitchDelegate"; value: qsTr("SwitchDelegate3") }
            }

            delegate: Loader {
                id: delegateLoader
                width: ListView.view.width
                sourceComponent: delegateComponentMap[type]

                required property string value
                required property string type
                required property var model
                required property int index

                property ListView view: listView

                readonly property var delegateComponentMap: {
                    "ItemDelegate": itemDelegateComponent,
                    "SwipeDelegate": swipeDelegateComponent,
                    "CheckDelegate": checkDelegateComponent,
                    "RadioDelegate": radioDelegateComponent,
                    "SwitchDelegate": switchDelegateComponent
                }

                Component {
                    id: itemDelegateComponent

                    ItemDelegate {
                        text: delegateLoader.value
                        width: delegateLoader.width
                    }
                }

                Component {
                    id: swipeDelegateComponent

                    SwipeDelegate {
                        id: swipeDelegate
                        text: delegateLoader.value
                        width: delegateLoader.width

                        Component {
                            id: removeComponent

                            Rectangle {
                                color: SwipeDelegate.pressed ? "#333" : "#444"
                                width: parent.width
                                height: parent.height
                                clip: true

                                SwipeDelegate.onClicked: {
                                    if (delegateLoader.view !== undefined)
                                        delegateLoader.view.model.remove(delegateLoader.index)
                                }

                                Label {
                                    font.pixelSize: swipeDelegate.font.pixelSize
                                    text: qsTr("Remove")
                                    color: "white"
                                    anchors.centerIn: parent
                                }
                            }
                        }

                        SequentialAnimation {
                            id: removeAnimation

                            PropertyAction {
                                target: delegateLoader
                                property: "ListView.delayRemove"
                                value: true
                            }
                            NumberAnimation {
                                target: swipeDelegate
                                property: "height"
                                to: 0
                                easing.type: Easing.InOutQuad
                            }
                            PropertyAction {
                                target: delegateLoader
                                property: "ListView.delayRemove"
                                value: false
                            }
                        }

                        swipe.left: removeComponent
                        swipe.right: removeComponent
                        ListView.onRemove: removeAnimation.start()
                    }
                }

                Component {
                    id: checkDelegateComponent

                    CheckDelegate {
                        text: delegateLoader.value
                    }
                }

                Component {
                    id: radioDelegateComponent

                    RadioDelegate {
                        text: delegateLoader.value

                        ButtonGroup.group: radioButtonGroup
                    }
                }

                Component {
                    id: switchDelegateComponent

                    SwitchDelegate {
                        text: delegateLoader.value
                    }
                }
            }
        }


    }
}
