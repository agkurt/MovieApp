//
//  PosterView.swift
//  MVVM-Project
//
//  Created by Ahmet Göktürk Kurt on 13.06.2023.
//

import UIKit

class PosterView : UIImageView {
    
    override init (frame : CGRect) {
        super.init (frame :frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func downloadPhoto(movie: MovieResults) {
        guard let photoURL = URL(string: APIURLs.imageURL(posterPath: movie._posterPath)) else { return }
        
        URLSession.shared.dataTask(with: photoURL) { data, _, error in
            if let error = error {
                print("Error downloading photo: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            // Use the downloaded data here
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.image = image
            }
        }.resume()
    }
}


