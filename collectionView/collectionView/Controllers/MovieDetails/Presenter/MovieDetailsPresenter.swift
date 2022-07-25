//
//  MovieDetailsPresenter.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 25.07.2022.
//

import Foundation

final class MovieDetailsPresenter: MovieDetailsViewOutput, MovieDetailsInteractorOutput, MovieDetailsModuleInput {
    
    weak var view: MovieDetailsViewInput!
    var interactor: MovieDetailsInteractorInput!
    var router: MovieDetailsRouterInput!
    
    private var movieId: Int!
    
    func didLoadView() {
        interactor.obtainMovieDetails(with: movieId)
        interactor.obtainMovieCast(with: movieId)
    }
    
    func didSelectCastCell(with castId: Int) {
        router.openCastModule(with: castId)
    }
    
    func didLoadMovieDetails(_ details: MovieDetailsEntity) {
        //notify view layer
        view.handleObtainedMovieDetails(details)
    }
    
    func didLoadMovieCast(_ cast: [Cast]) {
        //notify view layer
        view.handleObtainedCast(cast)
    }
    
    func configure(with movieId: Int) {
        self.movieId = movieId
    }
}
