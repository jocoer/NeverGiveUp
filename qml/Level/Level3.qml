// Level3

import QtQuick 2.15
import Felgo 3.0
import "../GameParts"

//每一关的起始位置都是5，4
Item {
    id: level

    width: 29 * gameScene.gridSize
    height: gameScene.height

    Platform {
        row: 5
    }
    DiePlatform {
        row: 6
    }
    Coin {
        row: 7
        column: 6
    }
    DiePlatform {
        row: 8
        column: 8
        rotation: 180
    }

    Repeater {
        model: 3
        Platform {
            row: 7 + index
        }
    }

    Repeater {
        model: 2
        Platform {
            row: 11 + index
            column: 5
            size: 2
        }
    }
    Coin {
        row: 11
        column: 7
    }

    Repeater {
        model: 2
        Platform {
            row: 14 + index
            column: 5
            size: 2
        }
    }
    Coin {
        row: 14
        column: 7
    }

    Repeater {
        model: 2
        Platform {
            row: 17 + index
            column: 5
            size: 2
        }
    }
    Coin {
        row: 17
        column: 7
    }
    Platform {
        row: 19
        column: 4
        size: 1
    }
    Platform {
        row: 21
        column: 5
        size: 2
    }
    Coin {
        row: 21
        column: 7
    }
    Platform {
        row: 22
        column: 4
        size: 1
    }
    Repeater {
        model: 5
        Platform {
            row: 24 + index
            column: 5
            size: 2
        }
    }
    Repeater {
        model: 3
        DiePlatform {
            row: 25 + index
            column: 9
            rotation: 180
        }
    }
    Coin {
        row: 24
        column: 7
    }

    SuccessPlatform {
        row: 30
        column: 5
    }
}
