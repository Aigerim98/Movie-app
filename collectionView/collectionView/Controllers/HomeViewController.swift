//
//  HomeViewController.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 24.05.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    
    private var sectionNames: [String] = ["Today at the cinema", "Coming soon", "Trending"]
    private var networkManager = NetworkManager.shared
    private var genres: [Genre] = []
    
//    private var trendingMovies: [Movie] = [] {
//        didSet{
//            collectionView.reloadData()
//        }
//    }
    //lazy var sectionMovies: [[Movie]] = [todayAtTheCinema, soonAtTheCinema, trending]
    var todayMovies: [Movie] = [] {
        didSet{
            tableView.reloadData()
        }
    }
    var soonMovies: [Movie] = [] {
        didSet{
            tableView.reloadData()
        }
    }
    var trendingMovies: [Movie] = [] {
        didSet{
            tableView.reloadData()
        }
    }
    
    lazy var sectionMovies: [[Movie]] = [todayMovies, soonMovies, trendingMovies]
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        loadGenres()
        loadMovies()
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HomeMoviesSectionCell", bundle: Bundle(for: HomeMoviesSectionCell.self)), forCellReuseIdentifier: "HomeMoviesSectionCell")
        tableView.estimatedRowHeight = 355
        tableView.rowHeight = UITableView.automaticDimension
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionNames.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeMoviesSectionCell", for: indexPath) as! HomeMoviesSectionCell
        cell.configure(with: (title: sectionNames[indexPath.row], movies: sectionMovies[indexPath.row]))
        return cell
    }
}

extension HomeViewController {
    func loadGenres() {
        networkManager.loadGenres {[weak self] genres in
            self?.genres = genres
        }
    }
    func loadMovies() {
        networkManager.loadSoonMovies { [weak self] movies in
            self?.soonMovies = movies
        }
        networkManager.loadTodayMovies { [weak self] movies in
            self?.todayMovies = movies
        }
        networkManager.loadTrendingMovies { [weak self] movies in
            self?.trendingMovies = movies
        }
    }
}
