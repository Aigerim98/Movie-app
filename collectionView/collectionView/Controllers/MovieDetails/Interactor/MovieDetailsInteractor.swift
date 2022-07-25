//
//  MovieDetailsInteractor.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 25.07.2022.
//

import Foundation

protocol MovieDetailsInteractorInput {
    func obtainMovieDetails(with movieId: Int)
    func obtainMovieCast(with movieId: Int)
}

protocol MovieDetailsInteractorOutput: AnyObject {
    func didLoadMovieDetails(_ details: MovieDetailsEntity)
    func didLoadMovieCast(_ cast: [Cast])
}

final class MovieDetailsInteractor: MovieDetailsInteractorInput {
    weak var output: MovieDetailsInteractorOutput!
    private var network: NetworkManager
    
    required init(network: NetworkManager) {
        self.network = network
    }
    
    func obtainMovieDetails(with movieId: Int) {
        network.loadMovieDetails(movieID: movieId) { [weak self] details in
            self?.output.didLoadMovieDetails(details)
        }
    }
    
    func obtainMovieCast(with movieId: Int) {
        network.loadCredits(movieID: movieId) { [weak self] cast in
            self?.output.didLoadMovieCast(cast)
        }
    }
}

