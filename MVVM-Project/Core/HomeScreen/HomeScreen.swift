//
//  HomeViewModel.swift
//  MVVM-Project
//
//  Created by Ahmet Göktürk Kurt on 30.05.2023.
//


import UIKit

    protocol HomeScreenInterface: AnyObject {
        func configureVC()
        func configureCollectionView()
        
    }
        
    final class HomeScreen: UIViewController {

        private let viewModel = HomeViewModel() // viewmodel = homeviewmodel
        
        private var collectionView : UICollectionView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            viewModel.view = self // viewmodel view sensin.
            viewModel.viewDidLoad()
        }
    }

    extension HomeScreen : HomeScreenInterface {
        func configureVC() {
            view.backgroundColor = .systemBackground
        }
        
        func configureCollectionView() {
            collectionView = UICollectionView(frame: .zero, collectionViewLayout:UIHelper.createHomeFlowLayout())
            view.addSubview(collectionView) // alt görünüm ekleme
            
            collectionView.translatesAutoresizingMaskIntoConstraints = false //storyboard kullanılmıyosa yapılır
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.resueID)
            
            collectionView.pinToEdgesOf(view: view)
            collectionView.reloadData()
        }
        
    }
                                              
    extension HomeScreen:UICollectionViewDelegate, UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            viewModel.movies.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.resueID, for: indexPath) as! MovieCell
            cell.setCell(movie: viewModel.movies[indexPath.item])
            
            return cell
        }
    }
