//
//  ViewController.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 16.05.2022.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet var movieTable: UITableView!
    
   // @IBOutlet var genreCollection: UICollectionView!
    
    private var movies: [Movie] = [] {
        didSet{
            movieTable.reloadData()
        }
    }
    private var networkManager = NetworkManager.shared
//    private var genres: [Genre] = [] {
//        didSet{
//            genreCollection.reloadData()
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // loadGenres()
        loadMovies()
        // Do any additional setup after loading the view.
//        movieTable.dataSource = self
//        movieTable.delegate = self
//        genreCollection.dataSource = self
//        genreCollection.delegate = self
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
//        if let destination = segue.destination as? MovieDetailsViewController {
//            destination.image = movies[(movieTable.indexPathForSelectedRow?.row)!].poster
//            destination.cast = movies[(movieTable.indexPathForSelectedRow?.row)!].cast ?? []
//            destination.rating = movies[(movieTable.indexPathForSelectedRow?.row)!].rating
//            destination.descriptionText = movies[(movieTable.indexPathForSelectedRow?.row)!].description
//            destination.movieNameText = movies[(movieTable.indexPathForSelectedRow?.row)!].name ?? ""
//            destination.releaseDate = movies[(movieTable.indexPathForSelectedRow?.row)!].dateOfRelease ?? ""
//            movieTable.deselectRow(at: movieTable.indexPathForSelectedRow!, animated: true)
//        }
//    }
    
}

func getGenres(by ids: [Int], genres: [Genre]) -> String? {
    var array: [String] = []
    for id in ids {
        array.append(genres.first {$0.id == id}?.name ?? "")
    }
    return array.joined(separator: ", ")
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return genres.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "genreCell", for: indexPath) as! GenreCollectionViewCell
//
//        //cell.genreLabel.text = genres[indexPath.row]
//        cell.genreLabel.text = getGenres(by: movies[indexPath.row].genreIds, genres: genres)
//        cell.contentView.layer.cornerRadius = 5
//        cell.contentView.layer.borderWidth = 1.0
//        cell.contentView.layer.borderColor = UIColor.orange.cgColor
//        cell.genreLabel.lineBreakMode = .byWordWrapping
//        return cell
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as! MovieTableViewCell
        cell.configure(with: movies[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
}

extension ViewController {
//    func loadGenres() {
//        networkManager.loadGenres {[weak self] genres in
//            self?.genres = genres
//        }
//    }
    func loadMovies() {
        networkManager.loadTodayMovies { [weak self] movies in
            self?.movies = movies
        }
    }
}
