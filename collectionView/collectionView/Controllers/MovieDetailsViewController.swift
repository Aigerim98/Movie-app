//
//  MovieDetailsViewController.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 26.05.2022.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    var movie: Movie!
    private var networkManager = NetworkManager.shared
    
    private var credits: [Cast] = [] {
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
        NetworkManager.shared.loadImage(with: movie.posterPath ?? "", completion: {[weak self] imageData in
            self?.posterImageView.image = UIImage(data: imageData)
        })
        dateOfReleaseLabel.text = movie.releaseDate
        movieNameLabel.text = movie.originalTitle
        movieDescriptionLabel.text = movie.description
        movieRatingLabel.text = "★ \(movie.voteAverage)"
        ratingContainerView.backgroundColor = setRatingColor(rating: movie.voteAverage)
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
        return credits.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviesCastCollectionViewCell", for: indexPath) as! MoviesCastCollectionViewCell
        print(credits[indexPath.row])
        cell.configure(with: credits[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/4, height: 165)
    }
}

extension MovieDetailsViewController {
    
    func loadCredits() {
        networkManager.loadCredits(movieID: movie.id) { [weak self] credits in
            print(credits)
            self?.credits = credits
        }
    }
}
