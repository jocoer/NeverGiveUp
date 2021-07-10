import Felgo 3.0
import QtQuick 2.15
import "./Scene"

GameWindow {
    id: gameWindow

    screenWidth: 960
    screenHeight: 640

    property int score: 0

    onSplashScreenFinished: beginscene.start()

    state: "begin"
    states: [
        State{
            name:"register"
            PropertyChanges {target: registerScene; opacity:1}
            PropertyChanges {target: gameWindow; activeScene: registerScene}
        },
        State{
            name:"login"
            PropertyChanges {target: loginScene; opacity:1 }
            PropertyChanges {target: gameWindow; activeScene: loginScene}
        },
        State {
            name: "begin"
            PropertyChanges {target: beginscene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: beginscene}
        },
        State {
          name: "game"
          PropertyChanges {target: gameScene; opacity: 1}
          PropertyChanges {target: gameWindow; activeScene: gameScene}
        },
        State {
          name: "stage"
          PropertyChanges {target: stageScene; opacity: 1}
          PropertyChanges {target: gameWindow; activeScene: stageScene}
        },
        State {
          name: "gameover"
          PropertyChanges {target: gameoverScene; opacity: 1}
          PropertyChanges {target: gameWindow; activeScene: gameoverScene}
        },
        State {
          name: "transit"
          PropertyChanges {target: transitScene; opacity: 1}
          PropertyChanges {target: gameWindow; activeScene: transitScene}
        },
        State {
            name: "clearance"
            PropertyChanges {target: gameclearanceScene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: gameclearanceScene}
        },
        State {
            name: "localscore"
            PropertyChanges {target: localscoreScene; opacity:1}
            PropertyChanges {target: gameWindow;activeScene:localscoreScene}
        }
    ]

    GameScene {
        id: gameScene
        onLoaded: gameWindow.state = "game"
        onBeginScenePressed: gameWindow.state = "begin"
        onRoledie: gameWindow.state = "gameover"
        onSuccess: {gameclearanceScene.score = gameScene.prescore;gameWindow.state = "clearance";gameclearanceScene.start()}
    }
    BeginScene {
        id: beginscene
        onStageScenePressed: gameWindow.state = "stage"
        onLocalscoreScenePressed: {gameWindow.state = "localscore";localscoreScene.start()}
    }
    StageScene{
        id: stageScene
        onLevelPressed: {
            gameScene.setLevel(selectedLevel)
            gameWindow.state = "transit"
        }
        onBeginScenePressed: gameWindow.state = "begin"
    }
    GameoverScene {
        id: gameoverScene
        onStageScenePressed: gameWindow.state = "stage"
        onGameScenePressed: {gameWindow.state = "game";}
    }
    TransitScene {
        id: transitScene

    }
    GameclearanceScene {
        id: gameclearanceScene
        onStageScenePressed: gameWindow.state = "stage"
        onGameScenePressed: gameWindow.state = "game"
    }
    Login {
        id:loginScene
    }

    Register {
        id:registerScene
        onRegisterSucceeded : gameWindow.state = "login"
    }
    LocalscoreScene {
        id: localscoreScene
        onBeginScenePressed: gameWindow.state = "begin"
    }
}
