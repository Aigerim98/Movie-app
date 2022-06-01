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
    let profilePath: String?
}



struct CreditsEntity: Decodable {
    let cast: [Cast]
    let id: Int
}
