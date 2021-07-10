import QtQuick 2.15
import QtQuick.Layouts 1.1
import Felgo 3.0
import "../Base"


SceneBase {
    id:loginPage

    signal loginSucceeded
    Image {
        source: "../../assets/bg.png"
        anchors.fill: loginScene.gameWindowAnchorItem
    }

    // login form background
    Rectangle {
        id: loginForm
        anchors.centerIn: parent
        color: "white"
        opacity: 0.2
        width: content.width + dp(48)
        height: content.height + dp(16)
        radius: dp(4)
    }

    // login form content
    GridLayout {
        id: content
        anchors.centerIn: loginForm
        columnSpacing: dp(20)
        rowSpacing: dp(10)
        columns: 2

        // headline
        AppText {
            Layout.topMargin: dp(8)
            Layout.bottomMargin: dp(12)
            Layout.columnSpan: 2
            Layout.alignment: Qt.AlignHCenter
            text: "登录"
        }

        // text and field
        AppText {
            text: qsTr("用户 :")
            font.pixelSize: sp(14)
        }

        AppTextField {
            id: txtUsername
            Layout.preferredWidth: dp(200)
            showClearButton: true
            font.pixelSize: sp(14)
            borderColor: "#72777b"
            radius: 20
            borderWidth: !Theme.isAndroid ? dp(2) : 0
            validator:RegExpValidator{regExp: /[0-9][0-9][0-9][0-9][0-9][0-9]/}
        }

        // password text and field
        AppText {
            text: qsTr("密码 :")
            font.pixelSize: sp(14)
        }

        //密码
        AppTextField {
            id: txtPassword
            Layout.preferredWidth: dp(200)
            showClearButton: true
            font.pixelSize: sp(14)
            //borderColor: Theme.tintColor
            borderColor: "#72777b"
            radius: 20
            borderWidth: !Theme.isAndroid ? dp(2) : 0
            echoMode: TextInput.Password
        }

        // column for buttons, we use column here to avoid additional spacing between buttons
        Column {
            Layout.fillWidth: true
            Layout.columnSpan: 2
            Layout.topMargin: dp(12)

            // buttons
            AppButton {
                text: qsTr("登录")
                flat: false
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    loginPage.forceActiveFocus() // move focus away from text fields

                    // simulate successful login
                    console.debug("logging in ...")
                    loginSucceeded()
                }
            }

            AppButton {
                text: qsTr("忘记密码？重新注册")
                flat: true
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    loginPage.forceActiveFocus() // move focus away from text fields

                    // call your server code to register here
//                    console.debug("registering...")
                    gameWindow.state="register"
                }
            }
        }
    }
    AppTextField {
        id:netwk
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        width: 100
        height: 15
        font.pixelSize: sp(12)
        textColor: "black"
        //borderColor: Theme.tintColor
        borderWidth: !Theme.isAndroid ? dp(1) : 0
        //echoMode: TextInput.Password
       }
}
