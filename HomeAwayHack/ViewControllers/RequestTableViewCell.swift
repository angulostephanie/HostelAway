//
//  RequestTableViewCell.swift
//  HomeAwayHack
//
//  Created by Kelly Lampotang on 7/14/18.
//  Copyright © 2018 Stephanie Angulo. All rights reserved.
//

import UIKit

class RequestTableViewCell: UITableViewCell {

    @IBOutlet weak var viewButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var requestLabel: UILabel!
    @IBOutlet weak var yesButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func yesButtonPressed(_ sender: Any) {
    }
    @IBAction func noButtonPressed(_ sender: Any) {
    }
    @IBAction func viewButtonPressed(_ sender: Any) {
        //viewRequestDetailSegue
    }
    
}
