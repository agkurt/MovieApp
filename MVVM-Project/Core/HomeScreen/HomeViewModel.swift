//
//  HomeViewModel.swift
//  MVVM-Project
//
//  Created by Ahmet Göktürk Kurt on 30.05.2023.
//

import Foundation

protocol HomeViewModelInterface {
    var view : HomeScreenInterface? {get set}
    func viewDidLoad()
    func getMovies()
}

final class HomeViewModel { // final yapıyoruz başka bir class inheritance etmesin diye.
    weak var view: HomeScreenInterface?
    private let service = MovieService()
    var movies : [MovieResults] = [ ]
}

extension HomeViewModel : HomeViewModelInterface { // Mantıksal olması için ve rahat okunabilir.Properties buraya yazılmaz.
    func viewDidLoad() {
        view?.configureVC()
        view?.configureCollectionView()
        getMovies()
    }
    func getMovies() {
        service.downloadService { [weak self] returnedMovies in // escaping ile uğraşıyorsak [weak self]
            guard let self = self else {return}
            guard let returnedMovies = returnedMovies else { return }
            
            self.movies = returnedMovies
           
            print(returnedMovies)
            
            
        }
    }
}


