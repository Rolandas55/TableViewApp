//
//  Movie.swift
//  TableViewApp
//
//  Created by kraujalis.rolandas on 27/10/2023.
//

import Foundation

struct Movie {
    let title: String
    let image: String
    let genre: String
    let year: Int
    let description: String
    let trailerURL: String
    
    static func createMovie() -> [Movie] {
        var movies: [Movie] = []
        
        let titles = DataManager.shared.movieTitles
        let images = DataManager.shared.imageNames
        let gengres = DataManager.shared.movieGenres
        let years = DataManager.shared.releaseYears
        let descriptions = DataManager.shared.descriptions
        let trailerURLs = DataManager.shared.movieTrailerUrls
        
        for i in 0..<titles.count {
            let movie = Movie(title: titles[i], image: images[i], genre: gengres[i], year: years[i], description: descriptions[i], trailerURL: trailerURLs[i])
            movies.append(movie)
        }
        return movies
    }
}
