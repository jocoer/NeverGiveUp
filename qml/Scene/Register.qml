import QtQuick 2.0
import "../Base"
import QtQuick.Layouts 1.1
import Felgo 3.0

SceneBase {
    id:registerPage

    signal registerSucceeded        //注册成功


    property string firPass: txtPassword.text
    property string secPass: againPassword.text


    function equalPass(firstPass,secondPass){
         if(firstPass!==secondPass)
             return 1
    }
    Image {
        source: "../../assets/bg.png"
        anchors.fill: registerScene.gameWindowAnchorItem
    }

    // register form background
    Rectangle {
        id: registerForm
        anchors.centerIn: parent
        color: "white"
        opacity: 0.2
        width: content.width + dp(48)
        height: content.height + dp(16)
        radius: dp(4)
    }

    // register form content
    GridLayout{
        id: content
        anchors.centerIn: registerForm
        columnSpacing: dp(20)
        rowSpacing: dp(5)
        columns: 2

        // headline
        AppText {
            Layout.topMargin: dp(8)
            Layout.bottomMargin: dp(12)
            Layout.columnSpan: 2
            Layout.alignment: Qt.AlignHCenter
            text: "注册"
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
//            borderColor: Theme.tintColor
            borderColor: "#72777b"
            radius: 20
            borderWidth: !Theme.isAndroid ? dp(2) : 0
            echoMode: TextInput.Password
        }

        AppText {
            text: qsTr("确认密码 :")
            font.pixelSize: sp(14)
        }

        AppTextField {
            id: againPassword
            Layout.preferredWidth: dp(200)
            showClearButton: true
            font.pixelSize: sp(14)
            borderColor: "#72777b"
            radius: 20
            borderWidth: !Theme.isAndroid ? dp(2) : 0
            echoMode: TextInput.Password
        }
        Column{
            Layout.fillWidth: true
            Layout.columnSpan: 2
            Layout.topMargin: dp(12)
             AppText {
                 id:passWarm
                 text: qsTr("输入的密码不重复，请重新设置密码")
                 color: "red"
                 font.pixelSize: sp(14)
                 visible: false
                 anchors.horizontalCenter: parent.horizontalCenter
                 }
             AppText {
                 id:emptyWarm
                 text: qsTr("数据输入不全,输入全部数据")
                 color: "red"
                 font.pixelSize: sp(14)
                 visible: false
                 anchors.horizontalCenter: parent.horizontalCenter
                 }
        }

        // column for buttons, we use column here to avoid additional spacing between buttons
        Column {
            Layout.fillWidth: true
            Layout.columnSpan: 2
            Layout.topMargin: dp(12)
            // buttons
            AppButton {
                text: qsTr("注册")
                flat: false
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    registerPage.forceActiveFocus() // move focus away from text fields
//                    console.debug("register in ...")

                    if(equalPass(firPass,secPass)){
                      console.log("密码不相等")
                      passWarm.visible=true
                    }
                    else if(txtUsername.text===""||againPassword.text===""||txtPassword.text==="")
                    {
                       console.log("未输入数据")
                        emptyWarm.visible=true
                    }else{
                        console.log("register success")
                        passWarm.visible=false
                        registerSucceeded()
                        txtUsername.text=""
                        txtPassword.text=""
                        againPassword.text=""
                    }
                    // simulate successful login


                }
            }
        }

     }
    AppButton{
        text: qsTr("返回")
        flat: false
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.rightMargin: 10
        onClicked: {
            registerPage.forceActiveFocus()
            console.debug("back in ...")
            gameWindow.state="login"
        }
    }

}
