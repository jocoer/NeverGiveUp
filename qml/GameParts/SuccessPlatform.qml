// successplatform.qml
// 通关台

import QtQuick 2.15
import Felgo 3.0
import "../Base"

PlatEntityBase {
    id: successplatform
    entityType: "successPlatform"

    PlatUnit {
        id: platformface
        image: "../../assets/successplatform.png"
    }

    BoxCollider {
        anchors.fill: parent
        bodyType: Body.Static
    }
}
