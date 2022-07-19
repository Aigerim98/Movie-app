//
//  MovieDetailsViewController.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 26.05.2022.
//

import UIKit
import Kingfisher

class MovieDetailsViewController: UIViewController {

    var movie: Movie!
    var movieId: Int!
    var movieDeatils: MovieDetailsEntity!
    
    private var networkManager = NetworkManager.shared
    
    private var casts: [Cast] = [] {
        didSet{
            castCollectionView.reloadData()
        }
    }
    
    @IBOutlet private var ratingContainerView: UIView!
    @IBOutlet private var movieDescriptionLabel: UILabel!
    @IBOutlet private var movieRatingLabel: UILabel!
    @IBOutlet private var dateOfReleaseLabel: UILabel!
    @IBOutlet private var movieNameLabel: UILabel!
    @IBOutlet private var castCollectionView: UICollectionView!
    @IBOutlet private var posterImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadMovieDetails()
        loadCredits()
        setData()
        configureCollectionView()
    }

    private func configureCollectionView() {
        castCollectionView.register(UINib(nibName: "MoviesCastCollectionViewCell", bundle: Bundle(for: MoviesCastCollectionViewCell.self)), forCellWithReuseIdentifier: "MoviesCastCollectionViewCell")
        castCollectionView.dataSource = self
        castCollectionView.delegate = self
        let layout = UICollectionViewFlowLayout()
        castCollectionView.collectionViewLayout = layout
        layout.scrollDirection = .horizontal
    }
   
    private func setData() {
//        let url = URL(string: movieDeatils.posterUrl ?? "")
//        posterImageView.kf.setImage(with: url)
        ratingContainerView.layer.cornerRadius = 3
//        dateOfReleaseLabel.text = movie.releaseDate
//        movieNameLabel.text = movie.originalTitle
//        movieDescriptionLabel.text = movie.description
//        movieRatingLabel.text = "★ \(movie.voteAverage)"
//        ratingContainerView.backgroundColor = setRatingColor(rating: movie.voteAverage)
        ratingContainerView.layer.cornerRadius = 5
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

extension MovieDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return casts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviesCastCollectionViewCell", for: indexPath) as! MoviesCastCollectionViewCell
        cell.configure(with: casts[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/4, height: 165)
    }
}

extension MovieDetailsViewController {
    
    func loadCredits() {
        networkManager.loadCredits(movieID: movieId!) { [weak self] casts in
            self?.casts = casts
        }
    }
    
    func loadMovieDetails() {
        networkManager.loadMovieDetails(movieID: movieId) { [weak self] movieD in
            let url = URL(string: movieD.posterUrl ?? "")
            self?.posterImageView.kf.setImage(with: url)
            
            self?.dateOfReleaseLabel.text = movieD.releaseDate
            self?.movieNameLabel.text = movieD.originalTitle
            self?.movieDescriptionLabel.text = movieD.description
            self?.movieRatingLabel.text = "★ \(movieD.voteAverage)"
            self?.ratingContainerView.backgroundColor = setRatingColor(rating: movieD.voteAverage)
        }
    }
}
