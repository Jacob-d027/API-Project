//
//  RepresentativeTableViewCell.swift
//  API Project
//
//  Created by Jacob Davis on 12/6/23.
//

import UIKit

class RepresentativeTableViewCell: UITableViewCell {

    @IBOutlet weak var representativeNameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
