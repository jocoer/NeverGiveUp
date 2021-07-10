// Role.qml
// 游戏人物

import QtQuick 2.15
import Felgo 3.0

EntityBase {
    id: playerentity

    entityType: "player"

    // 人物状态的信号
    signal move
    signal speedmove
    signal die
    signal success

    property alias upcollider: upcollider
    property alias controller: control // 控制器，传输键盘按键事件
    property var falling: upcollider.linearVelocity.y > 0 ? 1 : 0 // 判断人物是否处于下落状态
    property var supermove: 0 // 人物是否可以超级跳

        width: 16
        height: 16

        Image {
            source: "../../assets/blue.png"
            anchors.fill: parent
        }

        // 检测人物碰撞的物体
        BoxCollider {
            id: upcollider
            width: parent.width
            height: 1
            anchors.top: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            bodyType: Body.Dynamic // 因为人物是可动的
            sleepingAllowed: false
            fixture.onBeginContact: {
                var otherEntity = other.getBody().target
                var otherEntityType = otherEntity.entityType
                if (otherEntityType === "platform")
                {
                    if (supermove)
                    {
                        supermove = 0
                        speedmove()
                    }
                    else
                        move()
                }
                else if (otherEntityType === "dieplatform")
                {
                    die()
                }
                else if (otherEntityType === "successPlatform")
                {
                    success()
                }
            }
        }       
        BoxCollider{
            id: diecollider
            width: parent.width
            height: parent.height - 1
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            collisionTestingOnlyMode: true
            sleepingAllowed: false
            bodyType: Body.Dynamic
            fixture.onBeginContact: {
                var otherEntity = other.getBody().target
                var otherEntityType = otherEntity.entityType
                if (otherEntityType === "coin")
                {
                    otherEntity.collect()
                    gameScene.score++
                }
                else
                    die()
            }
        }

        // 控制器
        TwoAxisController {
            id: control
            inputActionsToKeyCode: {
                "up" : Qt.Key_Space
            }
            onInputActionPressed: {
                if (falling)
                    supermove = 1
            }
        }

        // 人物的粒子系统
        Particle {
            id: fireParticle1

            // 发射器的位置
            x: 0
            y: parent.height / 1.5
            sourcePositionVariance: Qt.point(0,0)

            // 粒子的属性配置
            maxParticles: 8
            particleLifespan: 0.9
            particleLifespanVariance: 0.2
            startParticleSize: 7
            startParticleSizeVariance: 2
            finishParticleSize: 10
            finishParticleSizeVariance: 2
            rotation: 0
            angleVariance: 0
            rotationStart: 0
            rotationStartVariance: 0
            rotationEnd: 0
            rotationEndVariance: 0

            // 发射器的行为
            emitterType: 0
            duration: 0
            positionType: 2

            gravity: Qt.point(0,0)
            speed: -30
            speedVariance: 2
            tangentialAcceleration: 0
            tangentialAccelVariance: 50

            // 颜色的变化及粒子内容
            startColor: Qt.rgba(251, 218, 65, 1)
            startColorVariance: Qt.rgba(0, 0, 0, 0)
            textureFileName: "../../assets/star.png"
            autoStart: true
        }
        Particle {
            id: fireParticle2

            // 发射器的位置
            x: 0
            y: parent.height / 1.25
            sourcePositionVariance: Qt.point(0,0)

            // 粒子的属性配置
            maxParticles: 8
            particleLifespan: 0.9
            particleLifespanVariance: 0.2
            startParticleSize: 7
            startParticleSizeVariance: 2
            finishParticleSize: 10
            finishParticleSizeVariance: 2
            rotation: 0
            angleVariance: 0
            rotationStart: 0
            rotationStartVariance: 0
            rotationEnd: 0
            rotationEndVariance: 0

            // 发射器的行为
            emitterType: 0
            duration: 0
            positionType: 2

            gravity: Qt.point(0,0)
            speed: -30
            speedVariance: 2
            tangentialAcceleration: 0
            tangentialAccelVariance: 50

            // 颜色的变化及粒子内容
            startColor: Qt.rgba(251, 218, 65, 1)
            startColorVariance: Qt.rgba(0, 0, 0, 0)
            textureFileName: "../../assets/star.png"
            autoStart: true
        }
}
