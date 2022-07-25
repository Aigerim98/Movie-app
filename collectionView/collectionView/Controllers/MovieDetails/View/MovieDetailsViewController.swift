//
//  MovieDetailsViewController.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 26.05.2022.
//

import UIKit
import Kingfisher

protocol MovieDetailsViewInput: AnyObject {
    func handleObtainedMovieDetails(_ details: MovieDetailsEntity)
    func handleObtainedCast(_ cast: [Cast])
}

protocol MovieDetailsViewOutput: AnyObject {
    func didLoadView()
    func didSelectCastCell(with castId: Int)
}

class MovieDetailsViewController: UIViewController {

    weak var output: MovieDetailsViewOutput?
    var dataDisplayManager: MovieDetailsDataDisplayManager?
    
    var movie: Movie!
    //var movieId: Int!
    var movieDetails: MovieDetailsEntity!
    
    
    @IBOutlet private var ratingContainerView: UIView!
    @IBOutlet private var movieDescriptionLabel: UILabel!
    @IBOutlet private var movieRatingLabel: UILabel!
    @IBOutlet private var dateOfReleaseLabel: UILabel!
    @IBOutlet private var movieNameLabel: UILabel!
    @IBOutlet private var castCollectionView: UICollectionView!
    @IBOutlet private var posterImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        output?.didLoadView()
    }

    private func configureCollectionView() {
        dataDisplayManager?.onCastMemeberDidSelect = { [weak self] castId in
            self?.output?.didSelectCastCell(with: castId)
        }
        castCollectionView.register(UINib(nibName: "MoviesCastCollectionViewCell", bundle: Bundle(for: MoviesCastCollectionViewCell.self)), forCellWithReuseIdentifier: "MoviesCastCollectionViewCell")
        castCollectionView.dataSource = dataDisplayManager
        castCollectionView.delegate = dataDisplayManager
//        let layout = UICollectionViewFlowLayout()
//        castCollectionView.collectionViewLayout = layout
//        layout.scrollDirection = .horizontal
    }
}

extension MovieDetailsViewController: MovieDetailsViewInput {
    func handleObtainedMovieDetails(_ details: MovieDetailsEntity) {
        movieNameLabel.text = details.originalTitle
        movieRatingLabel.text =  "★ \(details.voteAverage)"
        movieDescriptionLabel.text = details.description
        dateOfReleaseLabel.text = details.releaseDate
        title = details.originalTitle
        
        ratingContainerView.backgroundColor = setRatingColor(rating: details.voteAverage)
        ratingContainerView.layer.cornerRadius = 3
        
        let url = URL(string: details.posterUrl ?? "")
        posterImageView.kf.setImage(with: url)
    }
    
    func handleObtainedCast(_ cast: [Cast]) {
        dataDisplayManager?.casts = cast
        castCollectionView.reloadData()
    }
    
}

func setRatingColor(rating: Double) -> UIColor {
    if rating < 4 {
        return .systemRed
    }else if rating < 7.0{
        return .systemYellow
    }else {
        return .systemGreen
    }
}

