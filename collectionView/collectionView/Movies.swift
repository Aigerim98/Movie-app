//
//  Movies.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 17.05.2022.
//

import Foundation
import UIKit

struct Movie {
    var name: String?
    var poster: UIImage?
    var cast: [Cast]?
    var rating: Double?
    var description: String?
    var dateOfRelease: String?
    var genre: [String]?
}
struct Cast {
    var image: UIImage?
    var name: String?
    var role: String?
}
