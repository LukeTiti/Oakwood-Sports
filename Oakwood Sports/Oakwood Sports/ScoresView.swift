//
//  HomeView 2.swift
//  Oakwood Sports
//
//  Created by Luke Titi on 6/5/25.
//


import SwiftUI

struct ScoresView: View {
    @EnvironmentObject var appInfo: AppInfo

    var body: some View {
        NavigationView {
            List(appInfo.games, id: \.id) { game in
                HStack {
                    Text("\(game.team)")
                    Text("\(game.score.home) -")
                    Text("\(game.score.away)")
                    Text("\(game.opponent)")
                }
            }
            .navigationTitle("Games")
            .onAppear {
                if appInfo.games.isEmpty {
                    appInfo.loadGames()
                }
            }
        }
    }
}
