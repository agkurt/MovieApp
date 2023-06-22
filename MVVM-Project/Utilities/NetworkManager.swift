//
//  NetworkManager.swift
//  MVVM-Project
//
//  Created by Ahmet Göktürk Kurt on 28.05.2023.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager() //shared işlemi ile tek örnek olduğu belli.
    private init() {} // sınıfın tek bir örneği olması gerektiği için private
        
        func download(url: URL , completion : @escaping (Result<Data , Error>) -> ()) {
//Bu işlev, bir URL'yi parametre olarak alır ve veri indirmesi yapar.
            URLSession.shared.dataTask(with: url) { data , response , error in
//İndirme işlemi gerçekleşir.
                if let error = error { // unwrapp
                    print(error.localizedDescription)
                    completion(.failure(error))
                    return
                }
                guard
                    let response = response as? HTTPURLResponse,
                    response.statusCode == 200 else {
                    completion(.failure(URLError(.badServerResponse)))// belirtilen hata kodu
                    return
                }
                guard
                    let data = data else {
                    completion(.failure(URLError(.badURL)))
                    return
                }
                completion(.success(data))
            }
            .resume()
        }
    }
