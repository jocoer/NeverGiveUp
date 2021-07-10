//所有场景对象的顶层对象

import Felgo 3.0
import QtQuick 2.15

Scene {
  id: sceneBase

  width: 480
  height: 320
  gridSize: 25

  // 场景变换时改为1
  opacity: 0

  // 当opacity为1时即该场景需要可见
  visible: opacity > 0

  enabled: visible

  Behavior on opacity {
    NumberAnimation {property: "opacity"; easing.type: Easing.InOutQuad}
  }
}
