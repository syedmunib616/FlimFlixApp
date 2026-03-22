//
//  Title.swift
//  FilmFlix
//
//  Created by muqeet syed on 22/03/2026.
//

import Foundation

struct APIObject: Decodable {
    var results: [Title] = []
}

struct Title: Decodable, Identifiable {
    var id: Int?
    var title: String?
    var name: String?
    var overview: String?
    var posterPath: String?
}

//https://api.themoviedb.org/3/trending/movie/day?api_key=YOUR_API_KEY
   //https://api.themoviedb.org/3/movie/top_rated?api_key=YOUR_API_KEY
   //https://api.themoviedb.org/3/movie/upcoming?api_key=YOUR_API_KEY
   //https://api.themoviedb.org/3/search/movie?api_key=YourKey&query=PulpFiction
