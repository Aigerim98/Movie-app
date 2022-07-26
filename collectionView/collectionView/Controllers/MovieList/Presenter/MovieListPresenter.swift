//
//  MovieListPresenter.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 26.07.2022.
//

import Foundation

final class MovieListPresenter: MovieListViewOutput, MovieListInteractorOutput, MovieListModuleInput {
    
    weak var view: MovieListViewInput!
    var interactor: MovieListInteractorInput!
    var router: MovieListRouterInput!
    
    private var movies: [Movie] = []
    private var genres: [Genre] = []
    
    func getMovies(movies: [Movie]) {
        self.movies = movies
    }
    
    func getGenres(genres: [Genre]) {
        self.genres = genres
    }
  
    func didLoadView() {
        view.handleObtainedMovieList(movies)
        view.handleObtainedGenreList(genres)
    }
    
    func didSelectMovieCell(with movieId: Int) {
        router.openMovieDetailsModule(with: movieId)
    }
    
    func didSelectGenreCell(with genreId: Int) {
        interactor.obtainFilteredMovieList(with: movies, genredId: genreId)
    }
    
    func didFilterMovieList(_ movies: [Movie]) {
        view.handleObtainedMovieList(movies)
    }
}
