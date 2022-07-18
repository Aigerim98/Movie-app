//
//  MoviesCastCollectionViewCell.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 26.05.2022.
//

import UIKit
import Kingfisher

class MoviesCastCollectionViewCell: UICollectionViewCell {

    @IBOutlet private var castImageView: UIImageView!
    
    @IBOutlet private var castNameLabel: UILabel!
    
    @IBOutlet private var castRoleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        castImageView.clipsToBounds = true
        castImageView.layer.cornerRadius = castImageView.frame.size.height / 2
        // Initialization code
    }

    func configure(with casts: Cast){
     
        let url = URL(string: casts.profileUrl ?? "")
        castImageView.kf.setImage(with: url)
//        NetworkManager.shared.loadImage(with: casts.profilePath ?? "", completion: {[weak self] imageData in
//            self?.castImageView.image = UIImage(data: imageData)
//        })
        castNameLabel.text = casts.name
        castRoleLabel.text = casts.role
    }

}
