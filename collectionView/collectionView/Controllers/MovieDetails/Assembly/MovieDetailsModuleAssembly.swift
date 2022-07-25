//
//  MovieDetailsModuleAssembly.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 25.07.2022.
//

import Foundation
import UIKit

final class MovieDetailsModuleAssembly{
    func assemble() -> MovieDetailsViewController {
        let dataDisplayManager = MovieDetailsDataDisplayManager()
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as! MovieDetailsViewController
        let presenter = MovieDetailsPresenter()
        let network: NetworkManager = .shared
        
        let interactor = MovieDetailsInteractor(network: network)
        let router = MovieDetailsRouter()
        vc.dataDisplayManager = dataDisplayManager
        
        return vc
    }
}
