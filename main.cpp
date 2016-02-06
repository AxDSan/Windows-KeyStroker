/*
* GNU General Public License v2.0
*
* ############################################################
* #         Program Name: Windows Keystroker			     #
* #			Version:	  1.0							     #
* #			Description:  Shows Keyboard Keystrokes		     #
* #						  in Real-time.         		     #
* ############################################################
*
* Copyright (c) 2016 John Smith "0x90"
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.

* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*/

#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
