//
//  ViewCollectionDataManager.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 26.07.2022.
//

import Foundation
import UIKit

final class ViewCollectionDataManager: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    var genres: [Genre] = []
    var onGenreDidSelect: ((Int) -> Void)?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        genres.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "genreCell", for: indexPath) as! GenreCollectionViewCell

        //cell.genreLabel.text = genres[indexPath.row]
        cell.genreLabel.text = genres[indexPath.row].name
        cell.contentView.layer.cornerRadius = 5
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.orange.cgColor
        cell.genreLabel.lineBreakMode = .byWordWrapping
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onGenreDidSelect?(genres[indexPath.row].id)
    }
}
