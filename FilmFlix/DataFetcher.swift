//
//  DataFetcher.swift
//  FilmFlix
//
//  Created by muqeet syed on 23/03/2026.
//

import Foundation

let tmdbBaseURL = APIConfig.shared?.tmdbBaseURL
let tmdbAPIKey = APIConfig.shared?.tmdbAPIKey

//https://api.themoviedb.org/3/trending/movie/day?api_key=YOUR_API_KEY

func fetchTitles(for media:String) async throws -> [Title] {
    
    guard let baseURL = tmdbBaseURL else {
        throw NetworkingError.missingConfig
    }
    guard let apiKey = tmdbAPIKey else {
        throw NetworkingError.missingConfig
    }
    
    guard let fetchTitleURL = URL(string: baseURL)?
        .appending(path: "3/trending/\(media)/day")
        .appending(queryItems:  [
            URLQueryItem(name: "api_key", value: apiKey)
        ]) else{
        throw NetworkingError.urlBuildFailed
    }
    
    print(":::::::datafetch \(fetchTitleURL)")
    
    let(data, urlResponse) = try await URLSession.shared.data(from: fetchTitleURL)
    
    guard let response = urlResponse as? HTTPURLResponse, response.statusCode == 200 else {
        throw NetworkingError.badURLResponse(underlyingError: NSError(
            domain: "DataFetcher",
            code: (urlResponse as? HTTPURLResponse)?.statusCode ?? -1,
            userInfo: [NSLocalizedDescriptionKey: "Invalid HTTP response"]))
    }
    
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    
    return try decoder.decode(APIObject.self, from:data ).results
    
}
