// Level1

import QtQuick 2.15
import Felgo 3.0
import "../GameParts"

//每一关的起始位置都是5，4
Item {
    id: level

    width: 20 * gameScene.gridSize
    height: gameScene.height

    Repeater {
        model: 5
        Platform {
            row: 5 + index
            column: 4
            size: 1
        }
    }

    Repeater {
        model: 3
        Platform {
            row: 11 + index
            column: 4
            size: 1
        }
    }
    DiePlatform {
        row: 14
        column: 4
        size: 1
    }
    Repeater {
        model: 2
        Platform {
            row: 15 + index
            column: 4
            size: 1
        }
    }

    SuccessPlatform {
        row: 17
        column: 4
    }

    Coin {
        row: 6
        column: 6
        size: 1
    }
    Coin {
        row: 8
        column: 6
        size: 1
    }
}
