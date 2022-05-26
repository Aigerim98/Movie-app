//
//  CastCollectionViewCell.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 18.05.2022.
//

import UIKit

class CastCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var castImageView: UIImageView!
    @IBOutlet var castRoleLabel: UILabel!
    @IBOutlet var castNameLabel: UILabel!
//    
    func configure(with cast: Cast){
        castImageView.image = cast.image
        castRoleLabel.text = cast.role
        castNameLabel.text = cast.name
        castImageView.layer.cornerRadius = castImageView.frame.size.height / 2
        castImageView.clipsToBounds = true
        castNameLabel.lineBreakMode = .byWordWrapping
    }
}
