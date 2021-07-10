//TSoundByte.qml
//用于过渡的效果
import QtQuick 2.12

Item {

    id: r
    implicitWidth: (soundWidth + columnSpacing) * columnCount   //若未定义,自然宽度
    implicitHeight: (soundHeight + rowSpacing) * rowCount       //若未定义,自然高度
    Component {
        id: soundComp
        Image {
            source: "../../assets/pic2.png"
            width: soundWidth
            height: soundHeight
        }
    }// qml内联组件



    property bool running: true
    property int interval: 320
    property int soundWidth: 4
    property int soundHeight: 2

    property int rowCount: 15
    property int columnCount: 50

    property int rowSpacing: 2
    property int columnSpacing: 2

    property var objPool: []
    property var map:[]
    property int __arrayRatio: 100

    Component.onCompleted: {
        let startX = 0   //定义动画开始时x的位置
        let startY = r.height - 12
        for (let i = 0; i < columnCount; ++i) {
            map.push(getRandomInt(0, rowCount))

            let px = startX + i * (soundWidth + columnSpacing)
            for (let j = 0; j < rowCount; ++j) {
                let py =  startY - j * (soundHeight + rowSpacing)

                var obj = soundComp.createObject(r, {"x": px, "y": py, "visible": false})
                objPool[i * __arrayRatio + j] = obj
            }
        }
    }
    //let变量使startx只在这个部分里面有效，与var相似但是作用域只在声明区域里

    Timer {
        interval: r.interval    //触发器时间间隔
        running: r.running      //启动定时器
        repeat: true    //重复触发，形成连续不断的效果
        onTriggered: {
            map.push(getRandomInt(0, rowCount))
            map.shift()
            for (let i = 0; i < columnCount; ++i) {
                for (let j = 0; j < rowCount; ++j) {
                    objPool[i * __arrayRatio + j]["visible"] = j < map[i] ? true : false
                }
            }
        }
        //触发
    }
    function getRandomInt(min, max) {
      min = Math.ceil(min);         //对数字进行上舍入
      max = Math.floor(max);        //向下取舍
      return Math.floor(Math.random() * (max - min)) + min; //不含最大值，含最小值
    }
}
