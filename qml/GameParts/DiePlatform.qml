// DiePlatform.qml
// 陷阱对象，人物撞击该对象则死亡

import QtQuick 2.15
import Felgo 3.0
import "../Base"

PlatEntityBase {
    id: platform
    entityType: "dieplatform"
    property alias rotation: platformface.rotation

    column: 4 //默认为4

    PlatUnit {
        id: platformface
        image: "../../assets/dieplatform.png"
    }

    BoxCollider {
        anchors.fill: parent
        bodyType: Body.Static
    }

    SoundEffect {   // 撞击发出的音效
        id: soundeffect
        source: "../../assets/music/crash.wav"
    }
}
