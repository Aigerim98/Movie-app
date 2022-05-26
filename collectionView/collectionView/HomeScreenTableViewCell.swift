//
//  HomeScreenTableViewCell.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 24.05.2022.
//

import UIKit

class HomeScreenTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var collectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.rowWithMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeMovieCollectionCell", for: indexPath) as! MovieCollectionViewCell
        cell.movieNameLabel.text = self.rowWithMovies[indexPath.row].name ?? ""
        cell.moviePoster.image = self.rowWithMovies[indexPath.row].poster
//        cell.movieRatingLabel.text = "★ \(self.rowWithMovies[indexPath.row].rating!)" ?? ""
        if self.rowWithMovies[indexPath.row].rating != nil {
            cell.movieRatingLabel.text = "★ \(self.rowWithMovies[indexPath.row].rating!)"
            cell.movieRatingLabel.backgroundColor = .green
        }else {cell.movieRatingLabel.text = ""}
        cell.movieGenreLabel.text = self.rowWithMovies[indexPath.row].genre?.joined(separator: ",")
        return cell
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    var rowWithMovies:[Movie] = [Movie()]
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func updateCellWith(row: [Movie]) {
        self.rowWithMovies = row
    }
    
}

