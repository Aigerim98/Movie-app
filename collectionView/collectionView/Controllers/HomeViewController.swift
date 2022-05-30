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
            sectionMovies[0] = todayMovies
            tableView.reloadData()
        }
    }
    var soonMovies: [Movie] = [] {
        didSet{
            //sectionMovies.append(soonMovies)
            sectionMovies[1] = soonMovies
            tableView.reloadData()
        }
    }
    var trendingMovies: [Movie] = [] {
        didSet{
            //sectionMovies.append(trendingMovies)
            sectionMovies[2] = trendingMovies
            tableView.reloadData()
        }
    }
    
    lazy var sectionMovies: [[Movie]] = [[], [], []]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadGenres()
        
        loadMovies()
//                defultVals()
        configureTableView()
//        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (_) in
//            print("hello")
//            self.sectionMovies = [self.todayMovies, self.soonMovies, self.trendingMovies]
//            self.tableView.reloadData()
//            self.configureTableView()
//            print(self.todayMovies[0].originalTitle)
//
//        }
        //        print(todayMovies)
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
            guard let self = self else { return }
            self.trendingMovies = movies
        }
        networkManager.loadSoonMovies { [weak self] movies in
            guard let self = self else { return }
            self.soonMovies = movies
        }
        networkManager.loadTodayMovies { [weak self] movies in
            guard let self = self else { return }
            self.todayMovies = movies
            
            ////            }
        }
        
        
    }
}
