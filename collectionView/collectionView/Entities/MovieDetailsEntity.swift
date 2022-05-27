//
//  MovieDetailsEntity.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 27.05.2022.
//

import Foundation

struct MovieDetailsEntity: Decodable {
    enum CodingKeys: String, CodingKey {
        case originalTitle = "original_title"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case backdropPath = "backdrop_path"
        case description = "overview"
    }
    
    let originalTitle: String?
    let releaseDate: String?
    let voteAverage: Double
    let backdropPath: String?
    let description: String?
}
