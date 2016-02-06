import QtQuick 2.3
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0

Window {
    id: myWin
    width: shortcutArea.width
    height: shortcutArea.height
    visible: true
    opacity: 0
    flags: Qt.SplashScreen | Qt.FramelessWindowHint | Qt.WA_TranslucentBackground | Qt.WindowStaysOnTopHint
    color: "#00000000"
    y: Screen.height - 200
    onAfterRendering: {
        animateOpacityIn.start()
        console.log(qsTr("[!] Animation started."));
    }

    onOpacityChanged: {
        console.log(opacity)
        if(opacity == 1)
        {
            animateOpacityIn.stop()
            console.log(qsTr("[!] Animation Stopped."));
        }
    }

    NumberAnimation {
            id: animateOpacityIn
            target: myWin
            properties: "opacity"
            from: 0
            to: 1
            duration: 250
            easing {
                type: Easing.OutSine
            }
       }

    MouseArea {
        x: 344
        y: 430
        width: shortcutArea.width
        height: shortcutArea.height
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }
    }

    Rectangle{
        id: shortcutArea
        width: Screen.width
        height: 175
        color: "#80000000"
        anchors.verticalCenterOffset: 8
        anchors.horizontalCenterOffset: 0



        DropShadow {
            anchors.fill: shortcutText
            horizontalOffset: 0
            verticalOffset: 1.5
            radius: 1
            samples: 16
            color: "#000000"
            source: shortcutText
        }

        Text {
            id: shortcutText
            x: 148
            y: 6
            width: 284
            height: 70
            opacity: 0
            color: "white"
            font.capitalization: Font.AllUppercase
            text: qsTr("CTRL + 1") // Static Keystroke Placeholder.
            font.italic: false
            font.bold: true
            font.family: "Verdana"
            font.pointSize: 42
            anchors.centerIn: parent
        }
        anchors.centerIn: parent
    }
}
