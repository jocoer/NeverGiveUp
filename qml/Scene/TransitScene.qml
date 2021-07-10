import QtQuick 2.15
import QtQuick.Controls 2.12
import Felgo 3.0
import "../Base"

SceneBase {
    id: transitScene

//    signal stageScenePressed

        //color: "lightblue"
        anchors.fill: gameWindowAnchorItem

        Image {
            source: "../../assets/bg.png"
            anchors.fill: transitScene.gameWindowAnchorItem
        }
        Text {

            text: qsTr("Loading  ...")
            font.pixelSize: sp(24)
            color: "#f6f5ec"
            anchors.centerIn: gameWindowAnchorItem
        }

        TSoundByte {
            id: src

            anchors.centerIn: parent
            anchors.verticalCenterOffset: +65
            interval: 10
        }

        ShaderEffectSource {
            id: mirror
            width: src.width
            height: src.height
            x: src.x
            y: src.y + src.height - 10
            opacity: 0.3
            sourceItem: src
            transform: Rotation {
                origin.x: mirror.width/2
                origin.y: mirror.height/2
                axis.x: 1; axis.y: 0; axis.z: 0 //将TSoundByte绕x轴旋转
                angle: 180   //旋转180°
                }
        }
}

