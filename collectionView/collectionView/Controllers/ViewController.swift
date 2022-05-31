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

    private var networkManager = NetworkManager.shared
    var genres: [Genre] = []
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("loaded")
        movieTable.dataSource = self
        movieTable.delegate = self
        genreCollection.dataSource = self
        genreCollection.delegate = self
    }

}

func getGenres(by ids: [Int], genres: [Genre]) -> String? {
    var array: [String] = []
    for id in ids {
        array.append(genres.first {$0.id == id}?.name ?? "")
    }
    return array.joined(separator: ", ")
}

extension ViewController: UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genres.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "genreCell", for: indexPath) as! GenreCollectionViewCell

        //cell.genreLabel.text = genres[indexPath.row]
        cell.genreLabel.text = genres[indexPath.row].name
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
 
}
