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
    
    lazy var sectionMovies: [[Movie]] = [] {
        didSet{
            tableView.reloadData()
        }
    }
    
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
    
    func moveOnMovieDetails(tableIndex: Int, collectionIndex: Int) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "MovieDetailsViewController") as? MovieDetailsViewController else {
            return
        }
        vc.movie = sectionMovies[tableIndex][collectionIndex]
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sectionMovies.count
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeMoviesSectionCell", for: indexPath) as! HomeMoviesSectionCell
        cell.configure(with: (title: sectionNames[indexPath.row], movies: sectionMovies[indexPath.row]), genre: genres)
        cell.onAllMoviesButtonDidTap = { [weak self] in
            guard let self = self else {return}
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            vc.movies = self.sectionMovies[indexPath.row]
            vc.genres = self.genres
            self.navigationController?.pushViewController(vc, animated: true)
        }
        //cell.index = indexPath.row
        cell.didSelectCollectionClosure = {[weak self] item in
            if let item = item {
                self?.moveOnMovieDetails(tableIndex: indexPath.row, collectionIndex: item)
                tableView.deselectRow(at: indexPath, animated: true)
            }
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
            //print("Trending: ", self?.sectionMovies)
        }
        networkManager.loadSoonMovies { [weak self] movies in
            self?.soonMovies = movies
            self?.sectionMovies.append(movies)
            //print("Soon: ", self?.sectionMovies)
        }
        networkManager.loadTodayMovies { [weak self] movies in
            self?.todayMovies = movies
            self?.sectionMovies.append(movies)
            //print("Today: ", self?.sectionMovies)
        }
    }
}
