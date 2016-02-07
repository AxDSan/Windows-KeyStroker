import QtQuick 2.3
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0
import QtQuick.Dialogs 1.2


/*TODO:

[X] Fix text animation completely
[ ] Fix Text Shadow
[ ] Auto - Text position
[ ] Key combinations handler
[ ] Get rid of the Static placeholder / make handler
[X] Fix getting back from idle state animation
[ ] Add System Traybar lil' notifiation icon
[ ] Fix focus on app
*/

Window {
    id: myWin
    width: shortcutArea.width
    height: shortcutArea.height
    visible: true
    opacity: 1
    flags: Qt.SplashScreen | Qt.FramelessWindowHint | Qt.WA_TranslucentBackground | Qt.WindowStaysOnTopHint
    color: "#00000000"
    y: Screen.height - 200



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

    function delay(delayTime, cb) {
        timer.interval = delayTime;
        timer.repeat = false;
        timer.triggered.connect(cb);
        timer.start();
    }

    Timer {
        id: timer
    }

    Rectangle{
        id: shortcutArea
        width: Screen.width
        height: 175
        color: "#80000000"
        radius: 5
        opacity: 0
        anchors.verticalCenterOffset: 8
        anchors.horizontalCenterOffset: 0

        onOpacityChanged: {
            if(opacity == 1)
            {
                shortcutTextFadeIn.stop()
                console.log(qsTr("[!] Animation Stopped."));
            }
            if(shortcutText.opacity == 0)
            {
                shortcutAreaFadeOut.stop()
            }
        }

        NumberAnimation {
                id: shortcutTextFadeIn
                target: shortcutText
                properties: "opacity"
                from: 0
                to: 1
                duration: 500
                easing {
                    type: Easing.InSine
                }
           }


        NumberAnimation {
                id: shortcutAreaFadeOut
                target: shortcutArea
                properties: "opacity"
                from: 1
                to: 0
                duration: 500
                easing {
                    type: Easing.OutSine
                }
           }

        NumberAnimation {
                id: shortcutAreaFadeIn
                target: shortcutArea
                properties: "opacity"
                from: 0
                to: 1
                duration: 500
                easing {
                    type: Easing.InSine
                }
           }

        //
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
            width: 0
            height: 70
            opacity: 0
            color: "white"
            font.capitalization: Font.AllUppercase
            //text: qsTr("CTRL + 1") // Static Keystroke Placeholder.
            font.italic: false
            font.bold: true
            font.family: "Verdana"
            font.pointSize: 42
            anchors.centerIn: parent


            Item {
                id: keyHandler
                focus: true
                Keys.onPressed: {
                    if(event.modifiers && Qt.ControlModifier){
                        if (event.key === Qt.Key_A)
                        {
                            shortcutAreaFadeIn.start()
                            shortcutTextFadeIn.start()
                            event.accepted = true;
                            shortcutText.text = 'CTRL + A'
                            delay(1000, function() {
                                shortcutAreaFadeOut.start()
                            })
                        }
                        if (event.key === Qt.Key_B)
                        {
                            shortcutAreaFadeIn.start()
                            shortcutTextFadeIn.start()
                            event.accepted = true;
                            shortcutText.text = 'CTRL + B'
                            delay(1000, function() {
                                shortcutAreaFadeOut.start()
                            })
                        }
                    }
                }
            }
        }
        anchors.centerIn: parent
    }
}
