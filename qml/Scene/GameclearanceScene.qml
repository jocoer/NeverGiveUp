// GameclearanceScene.qml
// 游戏成功通过的界面

import Felgo 3.0
import "../Base"
import QtQuick 2.15

SceneBase{
    id:gameclearanceScene

    signal stageScenePressed    // menu
    signal gameScenePressed     // replay
    property int score: 0   // score

    //light aninmation start
    function start(){
        lightaninmation.start()
        console.log(gameclearanceScene.score)
    }

    //background image
    Image {
        id:bg
        anchors.fill: gameclearanceScene.gameWindowAnchorItem
        source: "../../assets/bg.png"
    }

    //machine image
    Image {
        id: machine
        source: "../../assets/machine.png"
        z: 1.5
        width: 150
        height: 150
        anchors.top: bg.top
        anchors.horizontalCenter: parent.horizontalCenter
    }

    //plates image
    Image {
        id: plates
        source: "../../assets/plates.png"
        z: 1.5
        width: 100
        height: 150
        anchors.right: machine.right
        anchors.left: bg.left
        anchors.top: machine.bottom
    }

    Row{
        spacing: 5
        anchors.top: bg.top
        anchors.left: bg.left
        //star image
        Image {
            id: star
            source: "../../assets/star1.png"
            width: 25
            height: 25
            z:2
        }
        //score
        Text {
            id: scorenum
            text: gameclearanceScene.score
            font.bold: true
            font.pixelSize: 22
        }
    }

    //light Background
    Image {
        id: lightbg1
        source: "../../assets/light.png"
        z:1.4
        opacity: 0.5
        width: 100
        height: 100
        anchors.top: machine.bottom
        anchors.horizontalCenter: machine.horizontalCenter
    }
    Image {
        id: lightbg2
        source: "../../assets/light.png"
        z:1.4
        opacity: 0.5
        width: 100
        height: 100
        anchors.top: machine.bottom
        anchors.horizontalCenter: machine.horizontalCenter
    }

    ParallelAnimation{
        id:lightaninmation
        NumberAnimation {
            target: lightbg1
            property: "rotation"
            from: 0
            to:360
            duration: 3000
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: lightbg1
            properties: "opacity"
            from: 0
            to:1
            duration: 3000
            easing.type: Easing.InOutQuad
        }

        NumberAnimation {
            target: lightbg1
            property: "scale"
            from: 1
            to:3.5
            duration: 3000
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: lightbg2
            property: "rotation"
            from: 0
            to:-360
            duration: 3000
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: lightbg2
            properties: "opacity"
            from: 0
            to:1
            duration: 3000
            easing.type: Easing.InOutQuad
        }

        NumberAnimation {
            target: lightbg2
            property: "scale"
            from: 1
            to: 3.5
            duration: 3000
            easing.type: Easing.InOutQuad
        }
    }


    //menu button
    Image {
        id: menubt
        source: "../../assets/menu.png"
        z:1.5
        width: 50
        height: 50
        anchors.bottom: bg.bottom
        anchors.left: bg.left
        MouseArea {
            anchors.fill: parent
            onClicked: {
                stageScenePressed()
            }
        }
    }

    //replay button
    Image {
        id: replaybt
        source: "../../assets/replay.png"
        z:1.5
        width: 50
        height: 50
        anchors.bottom: bg.bottom
        anchors.right: bg.right
        TapHandler {
            onTapped: gameScenePressed()
        }
    }
}
