//
//  MovieListInteractor.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 26.07.2022.
//

import Foundation

protocol MovieListInteractorInput {
    func obtainFilteredMovieList(with movies: [Movie], genredId: Int)
}

protocol MovieListInteractorOutput: AnyObject {
    func didFilterMovieList(_ movies: [Movie])
}

final class MovieListInteractor: MovieListInteractorInput {
    
    weak var output: MovieListInteractorOutput!
    var filteredMovies: [Movie] = []
    
    func obtainFilteredMovieList(with movies: [Movie], genredId: Int) {
        filteredMovies = movies.filter({ $0.genreIds.contains(genredId) })
        output.didFilterMovieList(filteredMovies)
    }
}

