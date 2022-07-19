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
   // let backdropPath: String?
    let posterUrl: String?
    let description: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        originalTitle = try? container.decodeIfPresent(String.self, forKey: .originalTitle)
        releaseDate = try? container.decodeIfPresent(String.self, forKey: .releaseDate)
        voteAverage = try container.decode(Double.self, forKey: .voteAverage)
        if let posterPath = try? container.decodeIfPresent(String.self, forKey: .backdropPath) {
            self.posterUrl = "https://image.tmdb.org/t/p/w200\(posterPath)"
        } else {
            posterUrl = nil
        }
        description = try? container.decodeIfPresent(String.self, forKey: .description)
    }
}
