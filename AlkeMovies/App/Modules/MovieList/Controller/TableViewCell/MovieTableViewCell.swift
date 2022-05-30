//
//  MovieTableViewCell.swift
//  AlkeMovies
//
//  Created by Pablo Manzur on 21/05/2022.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpTableViewCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    
    }
    
    
    private func setUpTableViewCell() {
        let image = UIImage(systemName: "chevron.right")
        let accessory  = UIImageView(frame:CGRect(x:0, y:0, width:(image?.size.width)!, height:(image?.size.height)!))
        accessory.image = image

        accessory.tintColor = UIColor.white
        self.accessoryView = accessory
        
        self.movieName.adjustsFontSizeToFitWidth = true
    }

}
