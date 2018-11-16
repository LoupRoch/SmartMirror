#!/usr/bin/env python
# -*- coding: utf-8 -*-
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, QThread, Signal, Slot
import sys, time, requests, json
import paho.mqtt.client as mqtt

class TimeHandler(QObject):
    def __init__(self, context, parent=None):
        super(TimeHandler, self).__init__(parent)
        self.win = parent
    @Slot(result=str)
    def getHour(self):
        return time.strftime("%H:%M")

    @Slot(result=str)
    def getDate(self):
        return time.strftime("%A %d %B")

class WeatherHandler(QObject):
    def __init__(self, context, parent=None):
        super(WeatherHandler, self).__init__(parent)
        self.APIKEY = "" #Paste your openweathermap api key
        self.win= parent
        self.r= requests.get("http://api.openweathermap.org/data/2.5/forecast?q=Sceaux,fr&units=metric&APPID={}".format(self.APIKEY))
        self.text= json.loads(self.r.text)
        self.liste = [self.text["list"][x] for x in range(0, 40, 8)]
        self.currentr = requests.get("http://api.openweathermap.org/data/2.5/weather?q=Sceaux,fr&units=metric&APPID={}".format(self.APIKEY))
        self.currenttext= json.loads(self.currentr.text)

    @Slot()
    def reloadFore(self):
        self.r = requests.get("http://api.openweathermap.org/data/2.5/forecast?q=Sceaux,fr&units=metric&APPID={}".format(self.APIKEY))
        self.text= json.loads(self.r.text)
        self.liste = [self.text["list"][x] for x in range(0, 40, 8)]

    @Slot(int, result=str)
    def getIcon(self, id):
        self.icon_list= [x["weather"][0]["icon"] for x in self.liste]
        return "Sources/{}.png".format(self.icon_list[id-1])

    @Slot(int, result=str)
    def getforeTemp(self, id):
        self.weatherlist = [x["main"]["temp"] for x in self.liste]
        return "{}°".format(int(self.weatherlist[id-1]))

    @Slot(int, result=str)
    def getDay(self, id):
        self.daydic = {
            "lundi" : ["Lun", "Mar", "Mer", "Jeu", "Ven"],
            "mardi" : ["Mar", "Mer", "Jeu", "Ven", "Sam"],
            "mercredi" : ["Mer", "Jeu", "Ven", "Sam", "Dim"],
            "jeudi" : ["Jeu", "Ven", "Sam", "Dim", "Lun"],
            "vendredi" : ["Ven", "Sam", "Dim", "Lun", "Mar"],
            "samedi" : ["Sam", "Dim", "Lun", "Mar", "Mer"],
            "dimanche" : ["Dim", "Lun", "Mar", "Mer", "Jeu"],

        }
        return str(self.daydic[time.strftime("%A")][id-1])

    @Slot()
    def reloadCurr(self):
        self.currentr = requests.get("http://api.openweathermap.org/data/2.5/weather?q=Sceaux,fr&units=metric&APPID={}".format(self.APIKEY))
        self.currenttext= json.loads(self.currentr.text)

    @Slot(result=str)
    def getcurrIcon(self):
        return "Sources/{}.png".format(self.currenttext["weather"][0]["icon"])

    @Slot(result=str)
    def getcurrTemp(self):
        return "{}°".format(int(self.currenttext["main"]["temp"]))

    @Slot(result=str)
    def getminmax(self):
        return "{}°/{}°".format(int(self.currenttext["main"]["temp_min"]), int(self.currenttext["main"]["temp_max"]))

    @Slot(result=str)
    def getcurrDesc(self):
        return self.currenttext["weather"][0]["main"]

class MQTTthread(QThread):
    def run(win):
        mqttclient= mqtt.Client()
        mqttclient.connect("localhost", 1883, 60)
        mqttclient.subscribe("testtopic")
        def on_message(p, a, message):
            print(message.payload.decode("utf-8"))
            communicate.mqttsignal.emit(message.payload.decode("utf-8"))
        mqttclient.on_message = on_message
        mqttclient.loop_forever()

class Communicate(QObject):
    mqttsignal = Signal(str)


if __name__ == '__main__':
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    ctx = engine.rootContext()
    engine.load("main.qml")
    win = engine.rootObjects()[0]
    timehandler = TimeHandler(ctx, win)
    ctx.setContextProperty("timehandler", timehandler)
    weatherhandler= WeatherHandler(ctx, win)
    ctx.setContextProperty("weatherhandler", weatherhandler)
    def saywords(words):
        win.findChild(QObject, "notesbox").setProperty('text', win.findChild(QObject, "notesbox").property("text")+"\n"+words)

    mqttthread= MQTTthread(win)
    communicate = Communicate()
    communicate.mqttsignal.connect(saywords)
    mqttthread.start()
    win.showFullScreen()
    sys.exit(app.exec_())
