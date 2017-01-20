//
//  MainTableViewCell.swift
//  MusicDirectory
//
//  Created by Cory Graham on 1/20/17.
//  Copyright © 2017 Graham.co. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    @IBOutlet weak var mainImage: UIImageView!

    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var trackName: UILabel!
    
    @IBOutlet weak var albumName: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
