//
//  GenresEntity.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 27.05.2022.
//

import Foundation

struct Genre: Decodable {
    let id: Int
    let name: String
}

struct GenresEntity: Decodable {
    let genres: [Genre]
}
