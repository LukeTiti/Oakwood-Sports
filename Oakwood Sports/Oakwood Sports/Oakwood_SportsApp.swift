//
//  Oakwood_SportsApp.swift
//  Oakwood Sports
//
//  Created by Luke Titi on 6/5/25.
//

import SwiftUI

@main
struct Oakwood_SportsApp: App {
    @StateObject private var appInfo = AppInfo()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appInfo)
        }
    }
}
