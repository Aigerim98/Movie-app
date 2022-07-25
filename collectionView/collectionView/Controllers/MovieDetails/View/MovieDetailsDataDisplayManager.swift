//
//  MovieDetailsDataDisplayManager.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 25.07.2022.
//

import Foundation
import UIKit

final class MovieDetailsDataDisplayManager: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var casts: [Cast] = []
    
    var onCastMemeberDidSelect: ((Int) -> Void)?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return casts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviesCastCollectionViewCell", for: indexPath) as! MoviesCastCollectionViewCell
        cell.configure(with: casts[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 148)
        //return CGSize(width: view.frame.width/4, height: 165)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onCastMemeberDidSelect?(casts[indexPath.row].id)
    }
    
}
