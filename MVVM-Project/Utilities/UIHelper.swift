//
//  UIHelper.swift
//  MVVM-Project
//
//  Created by Ahmet Göktürk Kurt on 9.06.2023.
//

import UIKit

enum UIHelper { // if we create func in the enum,we must used to static word
    static func createHomeFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let itemWitdh = CGFloat.dWith
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: itemWitdh, height: itemWitdh * 1.5)
        layout.minimumLineSpacing = 40
        
        return layout
    }
}

