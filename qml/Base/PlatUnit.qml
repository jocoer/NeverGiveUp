//每个平台的最基础的单元
//定义平台的大小和内容

import QtQuick 2.15
import Felgo 3.0

Item {
    width: gameScene.gridSize
    height: gameScene.gridSize

    property alias image: sprite.source

    MultiResolutionImage {
        id: sprite
        anchors.fill: parent
    }
}
