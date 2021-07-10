// GameScene.qml
// 游戏游玩界面

import QtQuick 2.15
import Felgo 3.0
import "../Base"
import "../GameParts"

SceneBase {
    id: gameScene

    // 该游戏场景的逻辑大小
    width: 480
    height: 320

    signal beginScenePressed    // 开始游戏
    signal roledie  // 人物死亡
    signal success  // 通关
    signal loaded   // 加载关卡完成

    property string activeLevelFileName // 当前关卡的名称
    property string levelName
    property int score: 0
    property int prescore: 0

    // 设置关卡名，便于加载
    function setLevel(fileName) {
        activeLevelFileName = fileName
        levelName = activeLevelFileName.slice(0,6)
        if (activeLevelFileName != "")
            loader.setSource("../Level/" + activeLevelFileName)
    }

    EntityManager {
        id: entityManager
        entityContainer: view
    }

    Keys.forwardTo: role.controller // 键盘输入给人物的控制器

    //游戏背景
    Image {
        id: background
        anchors.fill: parent.gameWindowAnchorItem
        source: "../../assets/back.jpg"
    }

    // 游戏元素的视图
    Item {
        id: view
        width: loader.implicitWidth
        height: loader.implicitHeight
        anchors.bottom: gameScene.gameWindowAnchorItem.bottom
        state: "speed1"
        states:[
            State {
                name:"speed1"
                PropertyChanges {target: rolex; duration: 487}
                PropertyChanges {target: viewx; duration: 487}
                PropertyChanges {target: gravity; gravity.y: 12.6}
            },
            State {
                name:"speed2"
                PropertyChanges {target: rolex; duration: 488}
                PropertyChanges {target: viewx; duration: 488}
                PropertyChanges {target: gravity; gravity.y: 20.6}
            }
        ]
        MovementAnimation {
            id: movement
            target: view
            property: "x"
            velocity: gameScene.gridSize //左移速度
            running: false
        }

        x: 0

        // 动态加载关卡
        Loader {
            id: loader
            asynchronous: true
            onLoaded: {
                gameScene.loaded()
            }         
        }

        Role {
            id: role
            x: gameScene.gridSize*5.2
            y: 138
            onMove: {
                view.state = "speed1"
                console.log("move")
                console.log(view.x)
                role.upcollider.linearVelocity.y = -100 //初速度
                view.x = view.x - (gameScene.gridSize)
                role.x = role.x + (gameScene.gridSize)
            }
            onSpeedmove: {
                view.state = "speed2"
                console.log("speedmove")
                console.log(view.x)
                role.upcollider.linearVelocity.y = -200 //初速度
                view.x = view.x - (gameScene.gridSize)*2
                role.x = role.x + (gameScene.gridSize)*2
            }
            onDie: {gameScene.reset();gameScene.roledie()} //人物撞上尖刺死亡
            onSuccess: {
                lstorage.init();lstorage.store(gameScene.levelName, gameScene.score);
                gameScene.prescore = gameScene.score;gameScene.reset();
                gameScene.success()
            }
            Behavior on x {
                PropertyAnimation {
                    id: rolex
                    target: role
                    property: "x"
                    easing.type: Easing.Linear
                }
            }
        }
        Behavior on x {
            PropertyAnimation {
                id: viewx
                target: view
                property: "x"
                easing.type: Easing.Linear
            }
        }

        //重力效果
        PhysicsWorld {
            id: gravity
            debugDrawVisible: true
            updatesPerSecondForPhysics: 30
            running: false
        }
        Border {
            x: 0
            y: gameScene.height - 10
            borderwidth: 6000
        }
    }

    // 开始游戏点击事件
    MouseArea {
        id: beginmouse
        anchors.fill: parent
        onClicked: {
            gravity.running = true
            enabled = false
        }
    }
    Row{
        spacing: 5
        anchors.top: background.top
        anchors.left: background.left
        //star image
        Image {
            id: star
            source: "../../assets/star1.png"
            width: 25
            height: 25
            z:2
        }
        //score
        Text {
            id: scorenum
            text: score
            font.bold: true
            font.pixelSize: 22
        }
    }

    // 背景音乐
    BackgroundMusic {
        id: music
        source: "../../assets/music/backgroundmusic.mp3"
    }

    // 保存成绩的数据库对象
    LStorage {
        id: lstorage
    }

    // 重置游戏场景
    function reset ()
    {
        gravity.running = false
        beginmouse.enabled = true
        view.state = "speed1"

        var platforms = entityManager.getEntityArrayByType("platform")
        for(var platform in platforms) {
          platforms[platform].reset()
        }
        var coins = entityManager.getEntityArrayByType("coin")
        for(var coin in coins) {
          coins[coin].reset()
        }
        role.x = gameScene.gridSize * 5.2
        role.y = 138
        role.upcollider.linearVelocity.y = 0
        role.supermove = 0
        view.x = 0

        score = 0
    }
}
