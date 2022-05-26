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
    
    private var soonAtTheCinema: [Movie] = [
        Movie.init(name: "Jurassic World: Dominion", poster: UIImage.init(named: "jurassicWorld.png"), dateOfRelease: "2022-06-10", genre: ["Action", "Thriller", "Science Fiction"]),
        Movie.init(name: "Avatar: The way of water", poster: UIImage.init(named: "avatarTheWayOfWater.jpeg"), dateOfRelease: "2022-16-12", genre: ["Action", "Fantasy", "Science Fiction"]),
        Movie.init(name: "DC league of super pets", poster: UIImage.init(named: "dcLeagueOfPets.jpg"), dateOfRelease: "2022-07-20", genre: ["Action", "Animation", "Science Fiction"]),
        Movie.init(name: "Lightyear", poster: UIImage.init(named: "lightyear.jpg"), dateOfRelease: "2022-06-17", genre: ["Animation", "Science Fiction", "Family"]),
        Movie.init(name: "Minions: the rise of Gru", poster: UIImage.init(named: "minionsTheRiseOfGru.jpg"), dateOfRelease: "2022-07-01", genre: ["Animation", "Adventure", "Comedy"])]
    
    private var todayAtTheCinema: [Movie] = [
        Movie.init(name: "Doctor Strange in the multiverse of  madness", poster: UIImage.init(named: "doctorStrange2.jpeg"), rating: 7.4, dateOfRelease: "2022-05-05", genre: ["Action", "Fantasy", "Science Fiction"]),
        Movie.init(name: "Top gun: Maverick", poster: UIImage.init(named: "topGunMaverick.jpg"), rating: 8.6, dateOfRelease: "2022-05-25", genre: ["Action", "Drama"]),
        Movie.init(name: "Everything everywhere all at once", poster: UIImage.init(named: "everythingEverywhere.jpg"),rating: 8.5, dateOfRelease: "2022-05-13", genre: ["Comedy", "Fantasy", "Science Fiction"]),
        Movie.init(name: "Downton Abbey: a new era", poster: UIImage.init(named: "downtonAbbeyANewEra.jpg"), rating: 7.7, dateOfRelease: "2022-04-29", genre: ["Drama", "Romance"]),
        Movie.init(name: "Sonic the hedgehog 2", poster: UIImage.init(named: "sonic2.jpg"), rating: 6.6, dateOfRelease: "2022-04-01", genre: ["Action", "Animation", "Science Fiction"])]
    
    private var trending: [Movie] = [
        Movie.init(name: "Doctor Strange in the multiverse of  madness", poster: UIImage.init(named: "doctorStrange2.jpeg"), rating: 7.4, dateOfRelease: "2022-05-05", genre: ["Action", "Fantasy", "Science Fiction"]),
        Movie.init(name: "Top gun: Maverick", poster: UIImage.init(named: "topGunMaverick.jpg"), rating: 8.6, dateOfRelease: "2022-05-25", genre: ["Action", "Drama"]),
        Movie.init(name: "Everything everywhere all at once", poster: UIImage.init(named: "everythingEverywhere.jpg"),rating: 8.5, dateOfRelease: "2022-05-13", genre: ["Comedy", "Fantasy", "Science Fiction"]),
        Movie.init(name: "Downton Abbey: a new era", poster: UIImage.init(named: "downtonAbbeyANewEra.jpg"), rating: 7.7, dateOfRelease: "2022-04-29"),
        Movie.init(name: "Sonic the hedgehog 2", poster: UIImage.init(named: "sonic2.jpg"), rating: 6.6, dateOfRelease: "2022-04-01", genre: ["Drama", "Romance"]),
        Movie.init(name: "Jurassic World: Dominion", poster: UIImage.init(named: "jurassicWorld.png"), dateOfRelease: "2022-06-10", genre: ["Action", "Thriller", "Science Fiction"])]
    
    lazy var sectionMovies: [[Movie]] = [todayAtTheCinema, soonAtTheCinema, trending]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
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
