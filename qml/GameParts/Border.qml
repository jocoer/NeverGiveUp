//Boder.qml
//游戏场景的下边界，触碰时人物死亡

import QtQuick 2.15
import Felgo 3.0

EntityBase {
  entityType: "Border"
  property alias borderwidth: bordercollider.width
  signal collider

  // 防止人物可以落到场景外
  BoxCollider {
    id: bordercollider
    height: 10
    bodyType: Body.Static // 该对象不能移动

    collisionTestingOnlyMode: true
  }
}
