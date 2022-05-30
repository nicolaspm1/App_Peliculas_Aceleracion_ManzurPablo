//
//  MovieDetail.swift
//  AlkeMovies
//
//  Created by Pablo Manzur on 22/05/2022.
//

import Foundation


struct MovieDetail: Codable {
    let id: Int
    let backdropPath: String?
    let title: String
    let originalLanguage: String
    let popularity: Double
    let releaseDate: String
    let overview: String
    let genres: [Genre]
}
