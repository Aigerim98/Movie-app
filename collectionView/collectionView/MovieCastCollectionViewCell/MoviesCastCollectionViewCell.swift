//
//  MoviesCastCollectionViewCell.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 26.05.2022.
//

import UIKit

class MoviesCastCollectionViewCell: UICollectionViewCell {

    @IBOutlet private var castImageView: UIImageView!
    
    @IBOutlet private var castNameLabel: UILabel!
    
    @IBOutlet private var castRoleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with cast: Cast){
        NetworkManager.shared.loadImage(with: cast.profilePath ?? "", completion: {[weak self] imageData in
            self?.castImageView.image = UIImage(data: imageData)
        })
        castNameLabel.text = cast.name
        castRoleLabel.text = cast.role
        castImageView.clipsToBounds = true
        castImageView.layer.cornerRadius = castImageView.frame.size.height / 2
    }

}
