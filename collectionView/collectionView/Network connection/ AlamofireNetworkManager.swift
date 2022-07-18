//
//   AlamofireNetworkManager.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 07.06.2022.
//

//import Foundation
//import Alamofire
//
//class AlamofireNetworkManager {
//    private let API_KEY = "e516e695b99f3043f08979ed2241b3db"
//
//    static var shared = AlamofireNetworkManager()
//
//    private lazy var urlComponents: URLComponents = {
//        var components = URLComponents()
//        components.scheme = "https"
//        components.host = "api.themoviedb.org"
//        components.queryItems = [
//            URLQueryItem(name: "api_key", value: API_KEY)
//        ]
//        return components
//    }()
//
//    func loadTodayMovies(completion: @escaping ([Movie]) -> Void){
//        loadMovies(path: "/3/movie/now_playing") {movies in
//            completion(movies)
//
//        }
//    }
//
//    func loadTrendingMovies(completion: @escaping ([Movie]) -> Void){
//        loadMovies(path: "/3/trending/movie/week") { movies in
//            completion(movies)
//
//        }
//    }
//
//    func loadSoonMovies(completion: @escaping ([Movie]) -> Void){
//        loadMovies(path: "/3/movie/upcoming") { movies in
//            completion(movies)
//
//        }
//    }
//
//    func loadGenres(completion: @escaping ([Genre]) -> Void) {
//        var components = urlComponents
//        components.path = "/3/genre/movie/list"
//        guard let requestUrl = components.url else {
//            return
//        }
//
//        AF.request(requestUrl).responseJSON { response in
//            guard let data = response.data else {
//                print("Error: Did not receive data")
//                return
//            }
//            do {
//                let genresEntity = try JSONDecoder().decode(GenresEntity.self, from: data)
//                DispatchQueue.main.async {
//                    completion(genresEntity.genres)
//                }
//            } catch {
//                DispatchQueue.main.async {
//                    completion([])
//                }
//            }
//        }
//    }
//
//    private func loadMovies(path: String,completion: @escaping ([Movie]) -> Void){
//        var components = urlComponents
//        components.path = path
//
//        guard let requestUrl = components.url else {
//            return
//        }
//
//        AF.request(requestUrl).responseJSON { response in
//            guard let data = response.data else {
//                print("Error: Did not receive data")
//                return
//            }
//            do {
//                let moviesEntity = try JSONDecoder().decode(MoviesEntity.self, from: data)
//                DispatchQueue.main.sync {
//                    completion(moviesEntity.results)
//                }
//            } catch {
//                DispatchQueue.main.async {
//                    completion([])
//                }
//            }
//        }
//    }
//
//    func loadCredits(movieID: Int, completion: @escaping ([Cast]) -> Void) {
//        var components = urlComponents
//        components.path = "/3/movie/\(movieID)/credits"
//
//        guard let requestUrl = components.url else {
//            return
//        }
//
//        AF.request(requestUrl).responseJSON { response in
//            guard let data = response.data else {
//                print("Error: Did not receive cast data")
//                return
//            }
//            do {
//                let creditsEntity = try JSONDecoder().decode(CreditsEntity.self, from: data)
//                DispatchQueue.main.async {
//                    completion(creditsEntity.cast)
//                }
//            }catch {
//                DispatchQueue.main.async {
//                    completion([])
//                }
//            }
//        }
//    }
//
//}
