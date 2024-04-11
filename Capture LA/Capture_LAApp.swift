//
//  Capture_LAApp.swift
//  Capture LA
//
//  Created by Aidan Williamson on 3/20/22.
//

import SwiftUI

@main
struct Capture_LAApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
