// BeginScene.qml
// 游戏开始界面

import QtQuick 2.15
import Felgo 3.0
import "../Base"

SceneBase {
    id: beginScene

    // 按钮信号，用于界面切换
    signal stageScenePressed
    signal gameoverScenePressed
    signal localscoreScenePressed

    function start()
    {
        logoaninmation.start()
    }

    // 背景图
    Image {
        anchors.fill: beginScene.gameWindowAnchorItem
        source: "../../assets/bg.png"
    }
    // Logo图
    Image {
        id: logo
        source: "../../assets/logo.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top:parent.top
        anchors.topMargin: 20
        width: 200
        height: 50
    }
    ParallelAnimation{  // 界面加载时Logo图的动画
        id:logoaninmation
        NumberAnimation{
            target: logo
            properties: "rotation"
            from: 0
            to: 360
            running: false
            duration: 1000
            //easing.type: Easing.InOutQuad
        }
        NumberAnimation{
            target: logo
            properties: "scale"
            from: 0.6
            to: 1
            duration: 1000
        }
    }
    // 界面其他视觉元素
    Image {
        id: spatter
        source: "../../assets/spatter.png"
        anchors.right: logo.left
        width: 70
        height: 70
    }
    Image {
        id: dead
        source: "../../assets/dead.png"
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.left: logo.right
        width: 70
        height: 70
    }

    // 按钮
    Column {
        anchors.centerIn: parent
        spacing: 5

        // 开始游戏按钮
        Image {
            id: beginbtn
            source: "../../assets/beginbtn.png"
            width: 75
            height: 75
            anchors.centerIn: parent
            Text {
                anchors.centerIn: parent
                text: qsTr("START")
                font.bold: true
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {beginbtnAnimation.start(); stageScenePressed()}
            }
            ScaleAnimator {
                id: beginbtnAnimation
                target: beginbtn
                running: false // 当点击时才播放动画
                from: 0.7
                to: 1
                duration: 500
                easing.type: Easing.OutElastic
            }
        }

        // 排行榜按钮
        Image {
            id: rankinglistbtn
            source: "../../assets/rankinglistbt.png"
            width: 60
            height: 60
            anchors.top: beginbtn.bottom
            anchors.horizontalCenter: beginbtn.horizontalCenter

            Text {
                anchors.centerIn: parent
                text: qsTr("RANKLIST")
                font.bold: true
                font.pointSize: 8
            }
        }

        // 本地成绩按钮
        Image {
            id: localscorebt
            source: "../../assets/btn.png"
            width:  60
            height: 30
            anchors.top: rankinglistbtn.bottom
            anchors.horizontalCenter: rankinglistbtn.horizontalCenter

            Text {
                anchors.centerIn: parent
                text: qsTr("LOCAL SCORE")
                font.bold: true
                font.pixelSize: 8
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {localscoreScenePressed()}
            }
        }
    }
}
