//
//  MovieService.swift
//  MVVM-Project
//
//  Created by Ahmet Göktürk Kurt on 30.05.2023.
//

import Foundation

final class MovieService {
    
    func downloadService(completion : @escaping ([MovieResults]?) -> ()) {
        guard // optinal ifadeyi kaldırdım.
            let url = URL(string: APIURLs.movies(page: 1)) else {return}
        NetworkManager.shared.download(url: url) {[weak self] result in //ram'den silinmesini sağlıyoruz weak self yaparak.escaping closure kullanıyosak yapmak zorundayız.
            guard
                let self = self else {return} // self için unwrapp işlemi
        
            switch result {
            case .success(let Data):
                completion(self.handleWithData(data : Data))
            case .failure(let error):
                self.handleWithError(error: error) //burda error:error yazmak yerine yani dışarı ifadesini kapatmak istersek
                // _ kullanmamız gerekir
            }
        }
    }
    private func handleWithError(error :Error) { // switch yapısındaki failure için bu işlem yapıldı.Error ifadesi için._
        print(error.localizedDescription)
    }
    private func handleWithData(data:Data) ->[MovieResults]? {
        do {
            let movie = try JSONDecoder().decode(Movie.self, from: data)
            return movie.results
        } catch {
            print(error)
            return nil
        }
    }
}

