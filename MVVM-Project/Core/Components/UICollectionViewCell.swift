//
//  UICollectionViewCell.swift
//  MVVM-Project
//
//  Created by Ahmet Göktürk Kurt on 12.06.2023.
//

import UIKit

class MovieCell :UICollectionViewCell {
    static let resueID = "MovieCell"
    private var posterImageView : PosterView!
    
    override init (frame : CGRect) {
        super.init (frame : frame)
        configureCell()
        ConfigurationPosterView()
    }
    required init? (coder : NSCoder) {
        fatalError("init (coder:) has not been impelemented")
    }
    func setCell(movie : MovieResults) {
        posterImageView.downloadPhoto(movie: movie)
    }
    
    private func configureCell () {
        backgroundColor = .systemBrown
        layer.cornerRadius = 16
        clipsToBounds = true
    }
    private func ConfigurationPosterView() {
        posterImageView = PosterView(frame: .zero)
        addSubview(posterImageView)
        
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        posterImageView.pinToEdgesOf(view: self)
        posterImageView.backgroundColor = UIColor (hex:"#240b4b")
    
    }
}
