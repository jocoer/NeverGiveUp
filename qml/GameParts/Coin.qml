// Coin.qml
// 金币对象，用作游戏成绩

import QtQuick 2.15
import Felgo 3.0
import "../Base"

PlatEntityBase {
    id: coin
    entityType: "coin"

    size: 1
    property bool collected: false // 当金币被收集，则消失

    PlatUnit {
        id: imagecoin
        visible: !collected
        image: "../../assets/coin.png"
        scale: 0.5
    }
    BoxCollider {
        id: collider
        anchors.fill: parent
        bodyType: Body.Static
        collisionTestingOnlyMode: true // 只是检测到有碰撞即可
    }

    function collect ()
    {
        coin.collected = true
    }

    // 重置金币的状态
    function reset() {
      coin.collected = false
    }
}
