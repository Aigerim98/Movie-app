//
//  HomeMoviesSectionCell.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 25.05.2022.
//

import UIKit

typealias Callback = () -> Void

class HomeMoviesSectionCell: UITableViewCell {
    private var movies: [Movie] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var onAllMoviesButtonDidTap: Callback?

    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "MoviesCollectionViewCell", bundle: Bundle(for: MoviesCollectionViewCell.self)), forCellWithReuseIdentifier: "MoviesCollectionViewCell")
    }
    
    func configure(with viewModel: (title: String?, movies: [Movie])) {
        titleLabel.text = viewModel.title
        movies = viewModel.movies
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
    }
}

extension HomeMoviesSectionCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviesCollectionViewCell", for: indexPath) as! MoviesCollectionViewCell
        cell.configure(with: movies[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 128, height: 270)
    }
}
