//
//  EditCell.swift
//  DataSource
//
//  Created by Grigoriy Sapogov on 11/09/2019.
//  Copyright © 2019 Sima-Land. All rights reserved.
//

import UIKit

class EditCell: UITableViewCell {

    @IBOutlet weak var textField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
