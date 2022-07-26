//
//  CastDetails.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 19.07.2022.
//

import Foundation

struct CastDetails: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case id = "id"
        case placeOfBirth = "place_of_birth"
        case birthday = "birthday"
        case profilePath = "profile_path"
        case biography = "biography"
        case department = "known_for_department"
    }
    
    let id: Int
    let name: String?
    let placeOfBirth: String?
    var biography: String?
    let birthday: String?
    let profileUrl: String?
    let department: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        name = try? container.decodeIfPresent(String.self, forKey: .name)
        biography = try? container.decodeIfPresent(String.self, forKey: .biography)
        placeOfBirth = try? container.decodeIfPresent(String.self, forKey: .placeOfBirth)
        birthday = try? container.decodeIfPresent(String.self, forKey: .birthday)
        department = try? container.decodeIfPresent(String.self, forKey: .department)
        
        if let posterPath = try? container.decodeIfPresent(String.self, forKey: .profilePath) {
            self.profileUrl = "https://image.tmdb.org/t/p/w200\(posterPath)"
        } else {
            self.profileUrl = nil
        }
    }
}
