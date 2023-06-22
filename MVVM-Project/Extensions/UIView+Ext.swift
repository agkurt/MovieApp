//
//  UIView+Ext.swift
//  MVVM-Project
//
//  Created by Ahmet Göktürk Kurt on 31.05.2023.
//

import UIKit

extension UIView {
    func pinToEdgesOf(view:UIView) {
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor), //Constraint'ler, UI öğelerinin ekranın farklı boyutlarına ve cihazlara uyumlu olmasını sağlar.
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    
}
