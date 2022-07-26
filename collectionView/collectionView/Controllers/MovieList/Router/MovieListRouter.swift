//
//  MovieListRouter.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 26.07.2022.
//

import Foundation
import UIKit

protocol MovieListRouterInput {
    func openMovieDetailsModule(with movieId: Int)
}

final class MovieListRouter: MovieListRouterInput {
    weak var viewController: UIViewController?
    
    func openMovieDetailsModule(with movieId: Int) {
        let vc = MovieDetailsModuleAssembly().assemble {[weak self] input in
            input.configure(with: movieId)
        }
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
 

