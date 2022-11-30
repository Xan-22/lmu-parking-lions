//
//  SceneDelegate.swift
//  ParkingLions
//
//  Created by Erik Navarro on 11/2/22.
//
//  Help from: https://betterprogramming.pub/ios-region-monitoring-with-swiftui-b1028fa8b95f

import SwiftUI
import Firebase
import UIKit

@main
class FireBaseDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions:
                     [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    @UIApplicationDelegateAdaptor(FireBaseDelegate.self) var appDelegate

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let options: UNAuthorizationOptions = [.badge, .sound, .alert]
          UNUserNotificationCenter.current()
            .requestAuthorization(options: options) { _, error in
              if let error = error {
                print("Error: \(error)")
              }
            }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
      application.applicationIconBadgeNumber = 0
      UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
      UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }

}
