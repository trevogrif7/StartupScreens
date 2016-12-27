//
//  SlideOutMenuTableViewCell.swift
//  StartupScreens
//
//  Created by Trevor Griffin on 12/26/16.
//  Copyright © 2016 TREVOR E GRIFFIN. All rights reserved.
//

import UIKit

class SlideOutMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var menuIconImage: UIImageView!
    @IBOutlet weak var menuItemLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
