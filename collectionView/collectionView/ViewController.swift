//
//  ViewController.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 16.05.2022.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet var movieTable: UITableView!
    
    @IBOutlet var genreCollection: UICollectionView!
    
    var genres: [String] = ["All", "Action", "Adventure", "Animated", "Fantasy", "Comedy"]
    
    var sonicDescription: String = "After discovering a small, blue, fast hedgehog, a small-town police officer must help him defeat an evil genius who wants to do experiments on him."
    
    var batmanDescription: String = "When a sadistic serial killer begins murdering key political figures in Gotham, Batman is forced to investigate the city's hidden corruption and question his family's involvement."
    
    lazy var sonicMovie: Movie = Movie.init(name: "Sonic The Hedgehog", poster: UIImage.init(named: "sonic.jpg"), cast: [Cast.init(image: UIImage.init(named: "ben_schwartz.jpg"), name: "Ben Schwartz", role: "Acting"), Cast.init(image: UIImage.init(named: "jim_carrey.jpg"), name: "Jim Carrey", role: "Acting"), Cast.init(image: UIImage.init(named: "natasha_rothwell.jpg"), name: "Natasha Rothwell", role: "Acting"), Cast.init(image: UIImage.init( named: "lee_majdoub.jpg"), name: "Lee Majdoub", role: "Acting")], rating: 6.5, description: sonicDescription, dateOfRelease: "14-02-2020")
    
    lazy var batmanMovie: Movie = Movie.init(name: "The Batman", poster: UIImage.init(named:"The_Batman_Poster.jpg"), cast: [Cast.init(image: UIImage.init(named:"robert_pattinson.jpg"), name: "Robert Pattinson", role: "Acting"), Cast.init(image: UIImage.init(named:"zoe_kravitz.jpg"), name: "Zoe Kravitz", role: "Acting"), Cast.init(image: UIImage.init(named:"jeffrey_wright.jpg"), name: "Jeffrey Wright", role: "Acting"), Cast.init(image: UIImage.init(named: "colin_farell.jpg"), name: "Colin Farell", role: "Acting")], rating: 7.7, description: batmanDescription, dateOfRelease: "04-03-2022")

    lazy var movies: [Movie] = [sonicMovie, batmanMovie]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        movieTable.dataSource = self
        movieTable.delegate = self
        genreCollection.dataSource = self
        genreCollection.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let destination = segue.destination as? MovieDetailsViewController {
            destination.image = movies[(movieTable.indexPathForSelectedRow?.row)!].poster
            destination.cast = movies[(movieTable.indexPathForSelectedRow?.row)!].cast ?? []
            destination.rating = movies[(movieTable.indexPathForSelectedRow?.row)!].rating
            destination.descriptionText = movies[(movieTable.indexPathForSelectedRow?.row)!].description
            destination.movieNameText = movies[(movieTable.indexPathForSelectedRow?.row)!].name ?? ""
            destination.releaseDate = movies[(movieTable.indexPathForSelectedRow?.row)!].dateOfRelease ?? ""
            movieTable.deselectRow(at: movieTable.indexPathForSelectedRow!, animated: true)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "genreCell", for: indexPath) as! GenreCollectionViewCell
        
        cell.genreLabel.text = genres[indexPath.row]
        cell.contentView.layer.cornerRadius = 5
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.orange.cgColor
        cell.genreLabel.lineBreakMode = .byWordWrapping
        return cell
    }
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
