import Felgo 3.0
import QtQuick 2.15
import "../Base"

SceneBase{

    id:gameoverScene
    signal stageScenePressed    //menu
    signal gameScenePressed     //replay
    signal gameclearanceScenePressed

    //background image
    Image {
        id:bg
        anchors.fill: gameScene.gameWindowAnchorItem
        source: "../../assets/bg.png"
    }
    //background color
    Rectangle{
        anchors.fill: bg
        color: "red"
        opacity: 0.35
        z:1
    }

    Image {
        id: watbg
        source: "../../assets/wat.png"
        z:1.5
        width: 150
        height: 150
        anchors.centerIn: parent
    }

    Image {
        id: deadbg
        source: "../../assets/dead.png"
        z:1.5
        width: 100
        height: 100
        //anchors.centerIn: parent
        anchors.top: watbg.bottom
        anchors.horizontalCenter: watbg.horizontalCenter
    }

    Image {
        id: red
        source: "../../assets/red.png"
        z:1.5
        width: 50
        height: 50
        anchors.left: bg.left
        anchors.top: bg.top
    }
    Text {
        id: deadtext
        z:1.5
        text: qsTr("YOU DIED!")
        anchors.right: parent.right
        anchors.rightMargin: 30
        anchors.top: parent.top
        anchors.topMargin: 30
        font {
            italic: true    //font ltalic
            bold: true
            pixelSize: 30
        }
    }
    //menu button
    Image {
        id: menubt
        source: "../../assets/menu.png"
        z:1.5
        width: 50
        height: 50
        anchors.bottom: parent.bottom
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
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        MouseArea {
            anchors.fill: parent
            onClicked: {
                gameScenePressed()
            }
        }
    }
}
