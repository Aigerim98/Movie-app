//
//  ViewController.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 16.05.2022.
//

import UIKit

protocol MovieListViewInput: AnyObject {
    func handleObtainedMovieList(_ movies: [Movie])
    func handleObtainedGenreList(_ genres: [Genre])
}

protocol MovieListViewOutput: AnyObject {
    func didLoadView()
    func didSelectMovieCell(with movieId: Int)
    func didSelectGenreCell(with genreId: Int)
}

class ViewController: UIViewController {


    @IBOutlet var movieTable: UITableView!
    
    @IBOutlet var genreCollection: UICollectionView!

    private var networkManager = NetworkManager.shared
    var tableDataDisplayManager: ViewTableDataDisplayManager?
    var collectionViewDataDisplayManager: ViewCollectionDataManager?
    var output: MovieListViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureCollectionView()
        output?.didLoadView()
    }
    
    private func configureCollectionView() {
        genreCollection.dataSource = collectionViewDataDisplayManager
        genreCollection.delegate = collectionViewDataDisplayManager
        collectionViewDataDisplayManager?.onGenreDidSelect = { [weak self] genreId in
            self?.output?.didSelectGenreCell(with: genreId)
        }
    }
    
    private func configureTableView() {
        movieTable.dataSource = tableDataDisplayManager
        movieTable.delegate = tableDataDisplayManager
        tableDataDisplayManager?.onMovieDidSelect = { [weak self] movieId in
            self?.output?.didSelectMovieCell(with: movieId)
        }
    }

}

func getGenres(by ids: [Int], genres: [Genre]) -> String? {
    var array: [String] = []
    for id in ids {
        array.append(genres.first {$0.id == id}?.name ?? "")
    }
    return array.joined(separator: ", ")
}

extension ViewController: MovieListViewInput {
    func handleObtainedMovieList(_ movies: [Movie]) {
        tableDataDisplayManager?.movies = movies
        movieTable.reloadData()
    }
    
    func handleObtainedGenreList(_ genres: [Genre]) {
        collectionViewDataDisplayManager?.genres = genres
        genreCollection.reloadData()
    }
}
