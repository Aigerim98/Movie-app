//
//  CastEntity.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 01.06.2022.
//

import Foundation

struct Cast: Decodable {
    enum CodingKeys: String, CodingKey {
        case role = "known_for_department"
        case name = "original_name"
        case id
        case profilePath = "profile_path"
    }
    
    let id: Int
    let role: String?
    let name: String?
    //let profilePath: String?
    let profileUrl: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try? container.decodeIfPresent(String.self, forKey: .name)
        role = try? container.decodeIfPresent(String.self, forKey: .role)
        if let posterPath = try? container.decodeIfPresent(String.self, forKey: .profilePath) {
            self.profileUrl = "https://image.tmdb.org/t/p/w200\(posterPath)"
        } else {
            profileUrl = nil
        }
    }
}

struct CreditsEntity: Decodable {
    let cast: [Cast]
    let id: Int
}
