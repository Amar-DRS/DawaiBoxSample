//
//  DawaiCell.swift
//  DawaiBox
//
//  Created by Apple on 28/07/18.
//  Copyright © 2018 AmarDRS. All rights reserved.
//

import UIKit

class DawaiCell: UITableViewCell {

    @IBOutlet weak var dawaiNameLBL: UILabel!
    @IBOutlet weak var infoLBL: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
