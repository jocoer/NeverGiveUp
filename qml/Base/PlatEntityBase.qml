//所有平台对象的顶层对象
//定义平台的通用属性

import QtQuick 2.15
import Felgo 3.0

EntityBase {
    id: platformEntity
    property int row: 0
    property int column: 0
    property int size
    property int disize: gameScene.gridSize*0.5

    x: row*gameScene.gridSize
//    y: level.height - (column+1)*gameScene.gridSize
    y: level.height - gameScene.gridSize - column * disize
    width: gameScene.gridSize
    height: gameScene.gridSize + disize * (size-1)
//    height: gameScene.gridSize * size
}
