//
//  SceneDelegate.swift
//  ParkingLions
//
//  Created by Erik Navarro on 11/2/22.
//

import UIKit
import SwiftUI
import CoreLocation

class AlertSettings: ObservableObject {
    @Published var showAlert = false
    @Published var lot: String?
}


public var counter: Bool = false

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var settings = AlertSettings()
    var firebaseService = ParkingLionsAreaService()
    let locationManager = CLLocationManager()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        let contentView = ContentView()

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView:  contentView
                .environmentObject(settings)
                .environmentObject(firebaseService)
            )
            self.window = window
            window.makeKeyAndVisible()
        }
        
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        
        let parkingA = CLLocationCoordinate2D(latitude: 33.966811, longitude: -118.417638)
        monitorRegionAtLocation(center: parkingA, identifier: "A")
        let parkingU = CLLocationCoordinate2D(latitude: 33.96692986091734, longitude: -118.42249616595379)
        monitorRegionAtLocation(center: parkingU, identifier: "U")
        let parkingL = CLLocationCoordinate2D(latitude: 33.96879831488729, longitude: -118.41940527593725)
        monitorRegionAtLocation(center: parkingL, identifier: "L")
        let parkingD = CLLocationCoordinate2D(latitude: 33.96927435740086, longitude: -118.41552078723907)
        monitorRegionAtLocation(center: parkingD, identifier: "D")
        let parkingE_F = CLLocationCoordinate2D(latitude: 33.969777123382656, longitude: -118.41396749774904)
        monitorRegionAtLocation(center: parkingE_F, identifier: "E-F")
        let parkingH = CLLocationCoordinate2D(latitude: 33.97279782280091, longitude: -118.41415822505951)
        monitorRegionAtLocation(center: parkingH, identifier: "H")
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }
    
    func monitorRegionAtLocation(center: CLLocationCoordinate2D, identifier: String) {
        

        if CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) {

            let region = CLCircularRegion(center: center,
                                          radius: 100.0, identifier: identifier)
            region.notifyOnEntry = true
            region.notifyOnExit = true

            locationManager.startMonitoring(for: region)
            
        }
    }
}

extension SceneDelegate : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {

        settings.showAlert = true
        settings.lot = region.identifier
        
        if UIApplication.shared.applicationState == .active {
            
        } else {
          let body = "How was parking at " + region.identifier + "?"
          let notificationContent = UNMutableNotificationContent()
            counter = true
            print("Counter: \(counter)")
          notificationContent.body = body
          notificationContent.sound = .default
          notificationContent.badge = UIApplication.shared.applicationIconBadgeNumber + 1 as NSNumber
          let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
          let request = UNNotificationRequest(
            identifier: "location_change",
            content: notificationContent,
            trigger: trigger)
          UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
              print("Error: \(error)")
            }
          }
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        
        settings.showAlert = false

        if UIApplication.shared.applicationState == .active {
            
        } else {
            
          let body = "Now Leaving: " + region.identifier
          let notificationContent = UNMutableNotificationContent()
            counter = false
            print("Counter: \(counter)")
          notificationContent.body = body
          notificationContent.sound = .default
          notificationContent.badge = UIApplication.shared.applicationIconBadgeNumber + 1 as NSNumber
          let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
          let request = UNNotificationRequest(
            identifier: "location_change",
            content: notificationContent,
            trigger: trigger)
          UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
              print("Error: \(error)")
            }
          }
        }
    }
}


