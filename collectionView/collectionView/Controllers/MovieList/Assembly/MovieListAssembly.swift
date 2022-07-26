//
//  MovieListAssembly.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 26.07.2022.
//

import Foundation
import UIKit

protocol MovieListModuleInput {
    func getMovies(movies: [Movie])
    func getGenres(genres: [Genre])
}

typealias MovieListModuleConfiguration = (MovieListModuleInput) -> Void

final class MovieListModuleAssembly {
    func assemble(_ configuration: MovieListModuleConfiguration) -> ViewController {
        let tableViewDataManager = ViewTableDataDisplayManager()
        let collectionViewDataManager = ViewCollectionDataManager()
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let presenter = MovieListPresenter()
        let interactor = MovieListInteractor()
        let router = MovieListRouter()
        
        configuration(presenter)
        
        vc.tableDataDisplayManager = tableViewDataManager
        vc.collectionViewDataDisplayManager = collectionViewDataManager
        vc.output = presenter
        
        presenter.view = vc
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.viewController = vc
        return vc
    }
}
