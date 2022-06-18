//
//  ExtensionUIViewController.swift
//  AlkeMovies
//
//  Created by Pablo Manzur on 29/05/2022.
//

import Foundation
import UIKit


extension UIViewController {
    
    func setNavigationBar(withTitle: String){
        self.navigationController?.navigationBar.tintColor = .systemRed
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: 50, height: 40))
        label.backgroundColor = .clear
        
        if withTitle.count <= 25 {
            label.font = UIFont(name: "Marker Felt Wide", size: 20)
        }
        else {
            label.font = UIFont(name: "Marker Felt Wide", size: 16)
        }
        
        
        label.text = withTitle
        label.numberOfLines = 0
        label.textColor = .white
        label.sizeToFit()
        label.textAlignment = .center
        
        self.navigationItem.titleView = label
        
        
    }
}
