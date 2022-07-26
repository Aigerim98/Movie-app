//
//  CastMemberViewController.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 23.05.2022.
//

import UIKit
import Kingfisher

protocol CastDetailsViewInput: AnyObject {
    func handleObtainedCastDetails(_ details: CastDetails)
}

protocol CastDetailsViewOutput: AnyObject {
    func didLoadView()
}

class CastMemberViewController: UIViewController {

    var personId: Int!
    var output: CastDetailsViewOutput?
    
    @IBOutlet var personNameLabel: UILabel!
    @IBOutlet var personImageView: UIImageView!
    @IBOutlet var biographyLabel: UILabel!
    @IBOutlet var departmentLabel: UILabel!
    @IBOutlet var birtdayBirthPlaceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.didLoadView()
    }
}

extension CastMemberViewController: CastDetailsViewInput {
    func handleObtainedCastDetails(_ details: CastDetails) {
        personNameLabel.text = details.name
        biographyLabel.text = details.biography
        print(details.biography)
        departmentLabel.text = details.department
        birtdayBirthPlaceLabel.text = (details.birthday ?? " ") + " in " + (details.placeOfBirth ?? " ")
        
        let url = URL(string: details.profileUrl ?? "")
        personImageView.kf.setImage(with: url)
    }
}
