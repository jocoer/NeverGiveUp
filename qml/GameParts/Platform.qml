// Platform.qml
// 游戏正常的跳台，撞击时人物自动向上跳跃

import QtQuick 2.15
import Felgo 3.0
import "../Base"

//生成一个有size高的平台
PlatEntityBase {
    id: platform
    entityType: "platform"

    size: 1 //默认为1
    column: 4 //默认为4

    property int colliderflag:0

    Column {
        spacing: -3
        PlatUnit {
            id: platformface
            image: colliderflag == 0 ? "../../assets/platform.png" : "../../assets/platformgreen.png"
        }
        PlatUnit {
            height: platform.disize * (size-1)
            image: "../../assets/bottom.png"
        }
    }

    BoxCollider {
        anchors.fill: parent
        bodyType: Body.Static
        fixture.onBeginContact: {
            animation()
            colliderflag = 1
            soundeffect.play()
        }
    }
    SoundEffect {   // 撞击跳台时的音效
        id: soundeffect
        source: "../../assets/music/crash.wav"
    }
    ScaleAnimator {     // 缩放动画
      id: platformAnimation
      target: platform
      running: false // 只有在撞击产生时才播放该动画
      from: 0.9
      to: 1
      duration: 800
      easing.type: Easing.OutElastic // 动画播放曲线
    }

    // 播放动画
    function animation() {
        platformAnimation.start()
    }

    // 重置跳台状态
    function reset ()
    {
        colliderflag = 0
    }


}
