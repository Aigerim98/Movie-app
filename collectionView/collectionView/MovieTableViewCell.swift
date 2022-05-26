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
    @IBOutlet var movieRatingLabel: UILabel!
    
    @IBOutlet var movieReleaseDateLabel: UILabel!
    @IBOutlet var movieNameLabel: UILabel!
    @IBOutlet var posterImageView: UIImageView!
    func configure(with movie: Movie){
        movieRatingLabel.text = "★ \(movie.rating!)"
        movieNameLabel.text = movie.name
        posterImageView.image = movie.poster
        movieReleaseDateLabel.text = movie.dateOfRelease
        movieNameLabel.lineBreakMode = .byWordWrapping
        posterImageView.layer.cornerRadius = 10
        posterImageView.clipsToBounds = true
        movieRatingLabel.layer.masksToBounds = true
        movieRatingLabel.layer.cornerRadius = 5
    }
}
