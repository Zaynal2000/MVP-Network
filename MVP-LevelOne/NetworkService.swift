//
//  NetworkService.swift
//  MVP-LevelOne
//
//  Created by Зайнал Гереев on 21.08.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func getComments(completion: @escaping(Result<[Comment]?, Error>) -> Void )
}

class NetworkService: NetworkServiceProtocol {
    
    func getComments(completion: @escaping (Result<[Comment]?, Error>) -> Void) {
        let urlSting = "https://jsonplaceholder.typicode.com/comments"
        guard let url = URL(string: urlSting) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do {
                let obj = try JSONDecoder().decode([Comment].self, from: data!)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
