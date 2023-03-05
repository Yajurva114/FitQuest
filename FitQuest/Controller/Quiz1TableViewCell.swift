//
//  Quiz1TableViewCell.swift
//  FitQuest
//
//  Created by yajurva shrotriya on 3/5/23.
//

import UIKit

class Quiz1TableViewCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
