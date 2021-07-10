import QtQuick 2.15
import Felgo 3.0

import "../Base"
import "../GameParts"
SceneBase{
    id:localsocreScene

    signal beginScenePressed

    Image {
        id: bg
        anchors.fill: localsocreScene.gameWindowAnchorItem
        source: "../../assets/bg.png"
    }

    Image {
        id: logo
        source: "../../assets/logo.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top:parent.top
        anchors.topMargin: 20
        width: 200
        height: 50
    }

    Image {
        id: spatter
        source: "../../assets/spatter.png"
        anchors.right: logo.left
        //anchors.horizontalCenter: logo.horizontalCenter
        width: 70
        height: 70
    }

    Image {
        id: dead
        source: "../../assets/dead.png"
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.left: logo.right
        //anchors.right: logo.horizontalCenter
        width: 70
        height: 70
    }

    // back button to begin scene
    Menubtn {
      text: "Back"
      // anchor the button to the gameWindowAnchorItem to be on the edge of the screen on any device
      anchors.right: localsocreScene.gameWindowAnchorItem.right
      anchors.rightMargin: 10
      anchors.bottom: localscoreScene.gameWindowAnchorItem.bottom
      //anchors.top: localsocreScene.gameWindowAnchorItem.top
      anchors.topMargin: 10
      onClicked: beginScenePressed()
    }
    Rectangle{
        width: 120
        height: 100
        anchors.horizontalCenter: bg.horizontalCenter
        anchors.verticalCenter: bg.verticalCenter
        color: "lightgray"
        ListModel{
            id:contactmodel
            ListElement{
                level_l: "level"
                score_l: "score"
            }

            ListElement{
                level_l: "1"
                score_l: "0"
            }
            ListElement{
                level_l: "2"
                score_l: "0"
            }
        }

        ListView{
            id:locallist
            width: 120
            height: 100
            model: contactmodel
            delegate:Text { text: level_l + "\t" + score_l;font.bold: true}
        }
    }

    LStorage {
        id: lstorage
    }

    function start ()
    {

        lstorage.init();
        contactmodel.clear()
        var data = lstorage.readAll()
        for (var i = 0; i < data.rows.length; i ++)
        {
            var level = data.rows[i].level
            var score = data.rows[i].score
            contactmodel.append({"level_l":level,"score_l":score.toString()})
        }
    }
}
