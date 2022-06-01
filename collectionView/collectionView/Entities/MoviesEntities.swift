//
//  TrendingMoviesEntities.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 27.05.2022.
//

import Foundation

struct Movie: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case originalTitle = "original_title"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case posterPath = "poster_path"
        case genreIds = "genre_ids"
        case description = "overview"
    }
    
    let id: Int
    let originalTitle: String?
    let releaseDate: String?
    let voteAverage: Double
    let posterPath: String?
    let genreIds: [Int]
    let description: String?
}

struct MoviesEntity: Decodable {
    let results: [Movie]
}
