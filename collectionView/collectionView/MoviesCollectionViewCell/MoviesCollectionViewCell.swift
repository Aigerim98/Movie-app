//
//  MoviesCollectionViewCell.swift
//  collectionView
//r
//  Created by Aigerim Abdurakhmanova on 25.05.2022.
//

import UIKit
import Kingfisher

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
    
    func configure(with movie: Movie, genre: [Genre]) {
        let url = URL(string: movie.posterUrl ?? "")
        posterImageView.kf.setImage(with: url)
        ratingContainerView.layer.cornerRadius = 3
//        NetworkManager.shared.loadImage(with: movie.posterPath ?? "", completion: {[weak self] imageData in
//            self?.posterImageView.image = UIImage(data: imageData)
//        })
        nameLabel.text = movie.originalTitle
        ratingLabel.text = "★ \(movie.voteAverage)"
        genreLabel.text = getGenres(by: movie.genreIds, genres: genre)
        if movie.voteAverage < 4 {
            ratingContainerView.backgroundColor = .systemRed
        }else if movie.voteAverage < 7 {
            ratingContainerView.backgroundColor = .systemYellow
        }else {
            ratingContainerView.backgroundColor =  .systemGreen
        }
    }
}

