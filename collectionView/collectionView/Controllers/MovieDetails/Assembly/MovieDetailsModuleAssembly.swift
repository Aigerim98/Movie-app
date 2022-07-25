//
//  MovieDetailsModuleAssembly.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 25.07.2022.
//

import Foundation
import UIKit

protocol MovieDetailsModuleInput {
    func configure(with movieId: Int)
}

typealias MovieDetailsModuleConfiguration = (MovieDetailsModuleInput) -> Void

final class MovieDetailsModuleAssembly{
    func assemble(_ configuration: MovieDetailsModuleConfiguration) -> MovieDetailsViewController {
        let dataDisplayManager = MovieDetailsDataDisplayManager()
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as! MovieDetailsViewController
        let presenter = MovieDetailsPresenter()
        let network: NetworkManager = .shared
        
        let interactor = MovieDetailsInteractor(network: network)
        let router = MovieDetailsRouter()
        
        configuration(presenter)
        
        vc.dataDisplayManager = dataDisplayManager
        vc.output = presenter
        
        presenter.view = vc
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        router.viewController = vc
        return vc
    }
}
