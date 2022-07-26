//
//  ViewDataDisplayManager.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 26.07.2022.
//

import Foundation
import UIKit

final class ViewTableDataDisplayManager: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var movies: [Movie] = []
    var onMovieDidSelect: ((Int) -> Void)?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as! MovieTableViewCell
        cell.configure(with: movies[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onMovieDidSelect?(movies[indexPath.row].id)
    }
    
}
