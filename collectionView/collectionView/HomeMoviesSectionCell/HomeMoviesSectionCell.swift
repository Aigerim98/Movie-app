//
//  HomeMoviesSectionCell.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 25.05.2022.
//

import UIKit

typealias Callback = () -> Void
typealias DidSelectClosure = ((_ index: Int?) -> Void)

class HomeMoviesSectionCell: UITableViewCell {
    
    private var movies: [Movie] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    @IBOutlet var allMovieButton: UIButton!
    
    private var genres: [Genre] = []
   
    var onAllMoviesButtonDidTap: Callback?
    var didSelectCollectionClosure: DidSelectClosure?
    
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollectionView()
    }
    
    @IBAction func showAllMovies(_ sender: UIButton) {
        (onAllMoviesButtonDidTap ?? {})()
    }
    
    private func configureCollectionView() {
        collectionView.register(UINib(nibName: "MoviesCollectionViewCell", bundle: Bundle(for: MoviesCollectionViewCell.self)), forCellWithReuseIdentifier: "MoviesCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
    }
    
    func configure(with viewModel: (title: String?, movies: [Movie]), genre: [Genre]) {
        titleLabel.text = viewModel.title
        movies = viewModel.movies
        genres = genre
    }
}

extension HomeMoviesSectionCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviesCollectionViewCell", for: indexPath) as! MoviesCollectionViewCell
        cell.configure(with: movies[indexPath.item], genre: genres)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 128, height: 270)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectCollectionClosure?(indexPath.item)
    }
    
}


