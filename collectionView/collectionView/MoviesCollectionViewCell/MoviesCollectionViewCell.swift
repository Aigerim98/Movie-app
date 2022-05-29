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
        NetworkManager.shared.loadImage(with: movie.posterPath ?? "", completion: {[weak self] imageData in self?.posterImageView.image = UIImage(data: imageData)})
        nameLabel.text = movie.originalTitle
        ratingLabel.text = "★ \(movie.voteAverage)"
        if movie.voteAverage < 4 {
            ratingContainerView.backgroundColor = .systemRed
        }else if movie.voteAverage < 7 {
            ratingContainerView.backgroundColor = .systemYellow
        }else {
            ratingContainerView.backgroundColor =  .systemGreen
        }
    }
}

