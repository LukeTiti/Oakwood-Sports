//
//  App Info.swift
//  Oakwood Sports
//
//  Created by Luke Titi on 6/5/25.
//
import SwiftUI

class AppInfo: ObservableObject {
    @Published var games: [Game] = []

    func loadGames() {
        guard let url = URL(string: "https://raw.githubusercontent.com/LukeTiti/Oakwood-Sports/refs/heads/main/Games.json") else {
            print("Invalid URL")
            return
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let games = try decoder.decode([Game].self, from: data)
                    DispatchQueue.main.async {
                        self.games = games
                    }
                } catch {
                    print("JSON decode error: \(error)")
                }
            } else if let error = error {
                print("Fetch error: \(error)")
            }
        }.resume()
    }

}



struct Game: Identifiable, Codable {
    var id = UUID()
    var sport: Sports
    var date: Date
    var team: String
    var opponent: String
    var home: Bool
    var score: Scores
    
    enum CodingKeys: String, CodingKey {
        case sport, date, team, opponent, home, score
    }
    
    // Custom decoding initializer
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        sport = try container.decode(Sports.self, forKey: .sport)
        date = try container.decode(Date.self, forKey: .date)
        team = try container.decode(String.self, forKey: .team)
        opponent = try container.decode(String.self, forKey: .opponent)
        home = try container.decode(Bool.self, forKey: .home)
        score = try container.decode(Scores.self, forKey: .score)
        id = UUID() // generate locally, not from JSON
    }
}

struct Scores: Codable {
    var home: Int
    var away: Int
}

enum Sports: String, Codable {
    case basketball
    
}
