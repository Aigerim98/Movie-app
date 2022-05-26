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
        if movie.rating != nil {
            movieRatingLabel.text = "★ \(movie.rating!)"
            movieRatingContainerView.backgroundColor = setRatingColor(rating: movie.rating!)
            movieRatingContainerView.layer.cornerRadius = 5
        }else {
            movieRatingLabel.text = ""
        }
        movieNameLabel.text = movie.name
        posterImageView.image = movie.poster
        
        movieReleaseDateLabel.text = movie.dateOfRelease
        movieNameLabel.lineBreakMode = .byWordWrapping
        
        posterImageView.layer.cornerRadius = 10
        posterImageView.clipsToBounds = true
    }
}
