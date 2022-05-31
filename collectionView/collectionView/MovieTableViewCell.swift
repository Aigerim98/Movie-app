//
//  MovieTableViewCell.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 17.05.2022.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet private var movieRatingLabel: UILabel!
    @IBOutlet private var movieRatingContainerView: UIView!
    @IBOutlet private var movieReleaseDateLabel: UILabel!
    @IBOutlet private var movieNameLabel: UILabel!
    @IBOutlet private var posterImageView: UIImageView!
    
    func configure(with movie: Movie){
        movieRatingContainerView.layer.cornerRadius = 5
        NetworkManager.shared.loadImage(with: movie.posterPath ?? "", completion: {[weak self] imageData in self?.posterImageView.image = UIImage(data: imageData)})
        movieNameLabel.text = movie.originalTitle
        movieRatingLabel.text = "★ \(movie.voteAverage)"
        movieReleaseDateLabel.text = movie.releaseDate
        if movie.voteAverage < 4 {
            movieRatingContainerView.backgroundColor = .systemRed
        }else if movie.voteAverage < 7 {
            movieRatingContainerView.backgroundColor = .systemYellow
        }else {
            movieRatingContainerView.backgroundColor =  .systemGreen
        }
    }
    
}
