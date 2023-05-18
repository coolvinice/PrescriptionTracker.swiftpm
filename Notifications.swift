//import SwiftUI
//
//func movingToBackground() {
//        print("Moving to the background")
//        notificationDate = Date()
//
//        fbManager.pause()
//
//    }
//
//
//    func movingToForeground() {
//        print("Moving to the foreground")
//        let deltaTime: Int = Int(Date().timeIntervalSince(notificationDate))
//
//        let deltaTimefill : Double = Double(deltaTime) / Double(300)
//
//        fbManager.breakElapsed -= deltaTime
//
//        if fbManager.breakElapsed <= 0 {
//            notify.sendNotification(
//                date: Date(),
//                type: "time",
//                timeInterval: 5,
//                title: "AppName+",
//                body: "Your timer has ended")
//        }
//
//
//        fbManager.breakFill += deltaTimefill
//
//        fbManager.startBreak()
//    }
