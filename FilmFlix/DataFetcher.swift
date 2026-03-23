//
//  DataFetcher.swift
//  FilmFlix
//
//  Created by muqeet syed on 23/03/2026.
//

import Foundation

let tmdbBaseURL = APIConfig.shared?.tmdbBaseURL
let tmdbAPIKey = APIConfig.shared?.tmdbAPIKey

func fetchTitles(for media:String) async throws -> [Title] {
    guard let baseURL = tmdbBaseURL else {
        throw NetworkError.missingConfig
    }
    guard let apiKey = tmdbAPIKey else {
        throw NetworkError.missingConfig
    }
    
   guard let fetchTitleURL = URL(string: baseURL)?
        .appending(path: "3/trending/\(media)/day")
        .appending(queryItems:  [
            URLQueryItem(name: "api_key", value: apiKey)
        ])
    
    print(":::::::datafetch \(fetchTitleURL)")
}
