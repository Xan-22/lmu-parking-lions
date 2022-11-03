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
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var settings = AlertSettings()
    let locationManager = CLLocationManager()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()

    
//         Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView:  contentView.environmentObject(settings))
            self.window = window
            window.makeKeyAndVisible()
        }
        
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization() // Make sure to add necessary info.plist entries
        
        let parkingA = CLLocationCoordinate2D(latitude: 33.966811, longitude: -118.417638)
        monitorRegionAtLocation(center: parkingA, identifier: "Parking A")
        let parkingUhall = CLLocationCoordinate2D(latitude: 33.96692986091734, longitude: -118.42249616595379)
        monitorRegionAtLocation(center: parkingUhall, identifier: "Parking U Hall")
        let parkingL = CLLocationCoordinate2D(latitude: 33.96879831488729, longitude: -118.41940527593725)
        monitorRegionAtLocation(center: parkingUhall, identifier: "Parking L")
        let parkingHealth = CLLocationCoordinate2D(latitude: 3.96927435740086, longitude: -118.41552078723907)
        monitorRegionAtLocation(center: parkingUhall, identifier: "Parking Health")
        let parkingE_F = CLLocationCoordinate2D(latitude: 33.969777123382656, longitude: -118.41396749774904)
        monitorRegionAtLocation(center: parkingUhall, identifier: "Parking E-F")
        let parkingH = CLLocationCoordinate2D(latitude: 33.97279782280091, longitude: -118.41415822505951)
        monitorRegionAtLocation(center: parkingUhall, identifier: "Parking H")
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    func monitorRegionAtLocation(center: CLLocationCoordinate2D, identifier: String) {
        
        // Make sure the devices supports region monitoring.
        if CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) {
           
            let maxDistance = locationManager.maximumRegionMonitoringDistance
            // For the sake of this tutorial we will use the maxmimum allowed distance.
            // When you are going production, it is recommended to optimize this value according to your needs to be less resource intensive
            
            // Register the region.
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

        if UIApplication.shared.applicationState == .active {
            
        } else {
            
          let body = "You arrived at " + region.identifier
          let notificationContent = UNMutableNotificationContent()
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
            
          let body = "You left " + region.identifier
          let notificationContent = UNMutableNotificationContent()
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


