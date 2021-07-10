import Felgo 3.0
import QtQuick 2.15
import "../Base"
import "../GameParts"

SceneBase {
  id: selectLevelScene

  // signal indicating that a level has been selected
  signal levelPressed(string selectedLevel)
  signal beginScenePressed

  // background
  Image {
      anchors.fill: stageScene.gameWindowAnchorItem
      source: "../../assets/back.jpg"
  }

  // back button to leave scene
  Menubtn {
    text: "Back"
    // anchor the button to the gameWindowAnchorItem to be on the edge of the screen on any device
    anchors.right: selectLevelScene.gameWindowAnchorItem.right
    anchors.rightMargin: 10
    anchors.top: selectLevelScene.gameWindowAnchorItem.top
    anchors.topMargin: 10
    onClicked: beginScenePressed()
  }

  // levels to be selected
  Grid {
    anchors.centerIn: parent
    spacing: 10
    columns: 5
    Menubtn {
      text: "1"
      width: 50
      height: 50
      onClicked: {
        levelPressed("Level1.qml")
      }
    }
    Menubtn {
      text: "2"
      width: 50
      height: 50
      onClicked: {
        levelPressed("Level2.qml")
      }
    }
    Menubtn {
      text: "3"
      width: 50
      height: 50
      onClicked: {
        levelPressed("Level3.qml")
      }
    }
    Repeater {
      model: 10
      Menubtn {
        text: " "
        width: 50
        height: 50
      }
    }
  }
}
