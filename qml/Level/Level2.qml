// Level2

import QtQuick 2.15
import Felgo 3.0
import "../GameParts"

//每一关的起始位置都是5，4
Item {
    id: level

    width: 29 * gameScene.gridSize
    height: gameScene.height

    Repeater {
        model: 5
        Platform {
            row: 5 + index
            column: 4
            size: 1
        }
    }
    DiePlatform {
        row: 7
        column: 8
        rotation: 180
    }

    Repeater {
        model: 2
        Platform {
            row: 11 + index
            column: 5
            size: 2
        }
    }
    Repeater {
        model: 2
        Platform {
            row: 14 + index
            column: 5
            size: 2
        }
    }
    Repeater {
        model: 2
        Platform {
            row: 17 + index
            column: 5
            size: 2
        }
    }

    Platform {
        row: 19
        column: 4
        size: 1
    }
    DiePlatform {
        row: 20
        column: 4
    }
    Coin {
        row: 21
        column: 6
    }
    Platform {
        row: 21
        column: 4
        size: 1
    }
    DiePlatform {
        row: 22
        column: 4
    }
    Coin {
        row: 23
        column: 6
    }
    Platform {
        row: 23
        column: 4
        size: 1
    }
    DiePlatform {
        row: 24
        column: 4
    }
    Repeater {
        model:5
        Platform {
            row: 25 + index
            column: 4
            size: 1
        }
    }
    DiePlatform {
        row: 26
        column: 8
        rotation: 180
    }
    DiePlatform {
        row: 28
        column: 8
        rotation: 180
    }

    SuccessPlatform {
        row: 30
        column: 4
    }

    Coin {
        row: 11
        column: 7
    }
    Coin {
        row: 13
        column: 7
    }
    Coin {
        row: 19
        column: 6
    }
}
