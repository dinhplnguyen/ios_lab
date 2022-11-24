//
//  week08_coreDataApp.swift
//  week08_coreData
//
//  Created by Dinh Phi Long Nguyen on 2022-10-28.
//

import SwiftUI

@main
struct CoreDataIntroApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(coreDataManager: CoreDataManager())
        }
    }
}
