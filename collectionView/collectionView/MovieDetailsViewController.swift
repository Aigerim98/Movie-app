//
//  MovieDetailsViewController.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 26.05.2022.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    var rating: Double!
    var descriptionText: String!
    var cast: [Cast] = []
    var image: UIImage!
    var movieNameText: String!
    var releaseDate: String!
    
    @IBOutlet private var ratingContainerView: UIView!
    @IBOutlet private var movieDescriptionLabel: UILabel!
    @IBOutlet private var movieRatingLabel: UILabel!
    @IBOutlet private var dateOfReleaseLabel: UILabel!
    @IBOutlet private var movieNameLabel: UILabel!
    @IBOutlet private var castCollectionView: UICollectionView!
    @IBOutlet private var posterImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        castCollectionView.dataSource = self
        castCollectionView.delegate = self
        configureViews()
    }
    
    private func getData() {
        posterImageView.image = image
        movieDescriptionLabel.text = descriptionText
        movieNameLabel.text = movieNameText
        dateOfReleaseLabel.text = releaseDate
        if rating != nil {
            movieRatingLabel.text = "★ \(rating!)"
            ratingContainerView.backgroundColor = setRatingColor(rating: rating)
            ratingContainerView.layer.cornerRadius = 5
        }else {
            movieRatingLabel.text = ""
            ratingContainerView.backgroundColor = .clear
        }
    }
    
    private func configureViews() {
        let layout = UICollectionViewFlowLayout()
        castCollectionView.collectionViewLayout = layout
        layout.scrollDirection = .horizontal
    }
    
}

func setRatingColor(rating: Double) -> UIColor { // не знаю в каком файле стоит создать функцию
    if rating >= 7.0 {
        return .systemGreen
    }else if rating < 7.0 && rating >= 5.0 {
        return .systemYellow
    }else {
        return .systemRed
    }
}

extension MovieDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? CastCollectionViewCell {
//            cell.castImageView.image = cast![indexPath.row].image
//            cell.castNameLabel.text = cast![indexPath.row].name
//            cell.castRoleLabel.text = cast![indexPath.row].role
//            cell.castImageView.layer.cornerRadius = cell.castImageView.frame.size.height / 2
//            cell.castImageView.clipsToBounds = true
//            cell.castNameLabel.lineBreakMode = .byWordWrapping
//            //cell.configure(with: cast[indexPath.row])
//            return cell
//        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CastCollectionViewCell
        cell.configure(with: cast[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/4, height: 165)
    }
}
