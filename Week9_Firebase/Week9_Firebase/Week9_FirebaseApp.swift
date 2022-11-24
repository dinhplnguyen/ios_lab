//
//  Week9_FirebaseApp.swift
//  Week9_Firebase
//
//  Created by Dinh Phi Long Nguyen on 2022-11-04.
//

import SwiftUI
import Firebase
@main
struct FirePhoneApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
                     [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

