//
//  MoviesCollectionViewCell.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 25.05.2022.
//

import UIKit

class MoviesCollectionViewCell: UICollectionViewCell {

    @IBOutlet private var posterImageView: UIImageView!
    @IBOutlet private var ratingContainerView: UIView!
    @IBOutlet private var ratingLabel: UILabel!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var genreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with movie: Movie) {
        posterImageView.image = movie.poster
        nameLabel.text = movie.name
        genreLabel.text = movie.genre?.joined(separator: ", ")
        guard let rating = movie.rating else { return }
        ratingLabel.text = "★ \(rating)"
        ratingContainerView.backgroundColor = .red
    }
}
