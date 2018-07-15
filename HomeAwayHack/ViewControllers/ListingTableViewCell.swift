//
//  ListingTableViewCell.swift
//  HomeAwayHack
//
//  Created by Kelly Lampotang on 7/14/18.
//  Copyright © 2018 Stephanie Angulo. All rights reserved.
//

import UIKit

class ListingTableViewCell: UITableViewCell {

    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var exampleImage: UIImageView!
    @IBOutlet weak var numSpots: UILabel!
    
    var data: ListingSearchHit? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
