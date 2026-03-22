//
//  APIConfig.swift
//  FilmFlix
//
//  Created by muqeet syed on 22/03/2026.
//

import Foundation

struct APIConfig: Decodable {
    let tmdbBaseURL: String
    let tmdbAPIKey: String
    
    static let shared = APIConfig = {
        guard let url = Bundle.main.url(forResource: "APIConfig", withExtension: "json") else {
            fatalError("APIConfig.json is missing or invalid")
    }
    
    do {
        
    } catch {
        
    }
    }()
}
