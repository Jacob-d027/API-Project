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
    

    func update(with rep: Representative) {
        representativeNameLabel.text = "Name: \(rep.name)"
        partyLabel.text = "Party: \(rep.party)"
        linkLabel.text = "Link: \(rep.link)"
    }

}
