//
//  ContentView.swift
//  Oakwood Sports
//
//  Created by Luke Titi on 6/5/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appInfo: AppInfo
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house.fill") {
                HomeView()
            }
            
            Tab("Scores", systemImage: "numbers.rectangle.fill") {
                ScoresView()
            }


            Tab("News", systemImage: "newspaper.fill") {
                NewsView()
            }
        }
    }
}

#Preview {
    ContentView()
        
}
