import QtQuick 2.15
import QtQuick.Controls  2.15
import QtQuick.Layouts 2.15

Window {
    id : window
    width: 400
    height: 640
    visible: true
    title: Qt.application.name

    // SwipeView 占据上方部分
    SwipeView {
        id: swipeView
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            bottom: tabBar.top // 与 TabBar 对齐
        }
        currentIndex: tabBar.currentIndex

        Page0{
        }

        Rectangle {
            color: "lightgreen"
            Label {
                anchors.centerIn: parent
                text: "Page 2"
                font.pixelSize: 20
            }
        }

        Rectangle {
            color: "lightcoral"
            Label {
                anchors.centerIn: parent
                text: "Page 3"
                font.pixelSize: 20
            }
        }
    }

    // TabBar 占据下方部分
     TabBar {
        id: tabBar
        width: parent.width // 确保宽度占满窗口
        height: 60 // 设置高度
        anchors.bottom: parent.bottom // 锚定窗口底部

        // 绑定 TabBar 和 SwipeView 的索引
        currentIndex: swipeView.currentIndex

        Repeater {
            model: ["Tab 1", "Tab 2", "Tab 3"]

            TabButton {
                 height: tabBar.height // 设置高度
                text: modelData
            }
        }
    }

    // ListModel {
    //     id:tabbar_model
    //     ListElement {title : "世界时钟"; icon: "";  url:""}
    //         ListElement {title : "闹钟p"; icon: "";  url:""}
    //                             ListElement {title : "秒表"; icon: "";  url:""}
    //                                         ListElement {title : "计时器"; icon: "";  url:""}
    // }

    // SwipeView {
    //     id:page_view
    //     anchors.fill: parent
    //     currentIndex:main_tarbar.currentIndex
    //     anchors.margins: 0
    //     Repeater {
    //         model: 4

    //         Pane {
    //             width: SwipeView.view.width
    //             height: SwipeView.view.height
    //             Rectangle{
    //                 anchors.fill: parent
    //                 Label{
    //                     anchors.centerIn: parent
    //                     text: "Page index :" + index
    //                 }
    //             }
    //         }
    //     }
    // }

    // footer: TabBar{
    //     id: main_tarbar
    //     width: parent.width
    //     anchors.fill: parent
    //     Repeater {
    //         model: tabbar_model
    //         TabButton {
    //             height:50
    //             text: model.title
    //             }
    //         }
    // }
}
