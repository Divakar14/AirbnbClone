//
//  AirbnbCloneApp.swift
//  AirbnbClone
//
//  Created by Divakar T R on 04/09/25.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }

}

@main
struct AirbnbCloneApp: App {
    
    // register app delegate for firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                RootView()
            }
        }
    }
    
}
