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
    
    var todayMovies: [Movie] = [] {
        didSet{
            //sectionMovies.append(todayMovies)
            tableView.reloadData()
        }
    }
    var soonMovies: [Movie] = [] {
        didSet{
           // sectionMovies.append(soonMovies)
            tableView.reloadData()
        }
    }
    var trendingMovies: [Movie] = [] {
        didSet{
            //sectionMovies.append(trendingMovies)
            tableView.reloadData()
        }
    }
    
    lazy var sectionMovies: [[Movie]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadGenres()
        loadMovies()
        configureTableView()
        
    }
    
    private func configureTableView() {
        tableView.register(UINib(nibName: "HomeMoviesSectionCell", bundle: Bundle(for: HomeMoviesSectionCell.self)), forCellReuseIdentifier: "HomeMoviesSectionCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 355
        tableView.rowHeight = UITableView.automaticDimension
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sectionMovies.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeMoviesSectionCell", for: indexPath) as! HomeMoviesSectionCell
        cell.configure(with: (title: sectionNames[indexPath.row], movies: sectionMovies[indexPath.row]), genre: genres)
        cell.onAllMoviesButtonDidTap = {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "AllMoviesController") as! ViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
        return cell
    }
}

extension HomeViewController {
    
    
    
    func loadGenres() {
        
        networkManager.loadGenres {[weak self] genres in
            guard let self = self else { return }
            self.genres = genres
        }
    }
    
    func loadMovies() {
        networkManager.loadTrendingMovies { [weak self] movies in
            self?.trendingMovies = movies
            self?.sectionMovies.append(movies)
        }
        networkManager.loadSoonMovies { [weak self] movies in
            self?.soonMovies = movies
            self?.sectionMovies.append(movies)
        }
        networkManager.loadTodayMovies { [weak self] movies in
            self?.todayMovies = movies
            self?.sectionMovies.append(movies)
        }
        
        
    }
}
