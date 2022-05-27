//
//  NetworkManager.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 27.05.2022.
//

import Foundation

class NetworkManager {
    private let API_KEY = "e516e695b99f3043f08979ed2241b3db"
    private let MOVIE_GENRES_URL: String = "https://api.themoviedb.org/3/genre/movie/list"
    
    static var shared = NetworkManager()
    
    private let session: URLSession
    
    private init() {
        session = URLSession(configuration: .default)
    }
    
    func loadGenres(completion: @escaping ([Genre]) -> Void) {
        var urlComponents = URLComponents(string: MOVIE_GENRES_URL)
        urlComponents?.queryItems = [
            .init(name: "api_key", value: API_KEY)
        ]
        guard let requestUrl = urlComponents?.url else {
            return
        }
        let task = session.dataTask(with: requestUrl) { data, response, error in
            guard error == nil else {
                print("Error: error calling GET")
                return
            }
            guard let data = data else {
                print("Error: Did not receive data")
                return
            }
            guard let response = response as? HTTPURLResponse, (200..<300) ~= response.statusCode else{
                print("Error: HTTP request failed")
                return
            }
            do {
                let genresEntity = try JSONDecoder().decode(GenresEntity.self, from: data)
                completion(genresEntity.genres)
            }catch {
                completion([])
            }
        }
        task.resume()
    }
}
